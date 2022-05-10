//
//  AuthModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI
import Firebase

class AuthModel: ObservableObject{
    @Published var userSesion: Firebase.User?
    @Published var isError = ""
    
    init(){
        self.userSesion = Auth.auth().currentUser
    }

    
    
    func signIn(){
//        Auth.auth().signIn(withEmail: email, password: password){(result, error) in
//            if error != nil{
//                print("DEBUG:\(error.localizedDescription)")
//            }else{
//                print("Success")
//            }
//        }
    }
    
    func SignUp(){
        
    }
    
    func resetPassword(){
        
    }
}
