//
//  AuthViewModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 29.04.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

class AuthViewModel: ObservableObject{
    @Published var userSesion: FirebaseAuth.User?
    @Published var isError = false
    @Published var errorMessage = ""
    
    init(){
        self.userSesion = Auth.auth().currentUser
        
        print("DEBUG: usersesion init ")
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    
    func login(withEmail email: String, password: String){
        if !isValidEmail(email) {
            errorMessage = "Email is invalid"
            withAnimation {
                isError = true
               
            }
            return
        }
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error{
                self.errorMessage = error.localizedDescription
                withAnimation {
                    self.isError = true
                   
                }
                return
            }
            guard let user = result?.user else {return}
            self.userSesion = user
        }
    }
    func register(withEmail email: String, password: String, fullname: String, username: String){
        if fullname == ""{
            
            errorMessage = "Full name can't be empty"
            withAnimation {
                isError = true
               
            }
            return
        }
        if !isValidEmail(email) {
            errorMessage = "Email is invalid"
            withAnimation {
                isError = true
               
            }
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            if let error = error{
                
                self.errorMessage = error.localizedDescription
                withAnimation {
                    self.isError = true
                   
                }
                return
            }
            guard let user = result?.user else {return}
            self.userSesion = user
            
            print("DEBUG: register user success\(String(describing: self.userSesion))")
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){_ in
                    print("DEBUG: did uplad user data")
                }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
      // 3
      Auth.auth().signIn(with: credential) { [unowned self] (result, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
            if let error = error{
                self.errorMessage = error.localizedDescription
                withAnimation {
                    self.isError = true
                   
                }
                return
            }
            guard let user = result?.user else {return}
            print("result\(result?.user.email)")
            let data = ["email": result?.user.email, "username": result?.user.displayName?.lowercased(), "fullname": result?.user.displayName, "uid": result?.user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){_ in
                    print("DEBUG: did uplad user data")
                }
            self.userSesion = user
        }
      }
    }
    
    
    func  googleSignIn() {
      // 1
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
            authenticateUser(for: user, with: error)
        }
      } else {
        // 2
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // 3
        let configuration = GIDConfiguration(clientID: clientID)
        
        // 4
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        // 5
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
          authenticateUser(for: user, with: error)
        }
      }
    }
    
    func signOut(){
        userSesion = nil
        GIDSignIn.sharedInstance.signOut()
        try? Auth.auth().signOut()
    }
}
