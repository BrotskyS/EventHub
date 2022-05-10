//
//  SignUpView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ScrollView{
            
            VStack{
                CustomField(text: $fullName, icon: "person", placeholder: "Full name")
                
                CustomField(text: $email, icon: "envelope", placeholder: "abc@gmail.com")
                CustomField(text: $password, icon: "lock", isSecure: true, placeholder: "Password")
                CustomField(text: $confirmPassword, icon: "lock", isSecure: true, placeholder: "Confirm password")
            }
            .padding(1)
            
            if viewModel.isError{
                HStack{
                    Image(systemName: "xmark.circle")
                        .font(.title3)
                    Text(viewModel.errorMessage)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                    .foregroundColor(.red.opacity(0.7))
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                    
                     
            }
            
            
            Button{
                if password == confirmPassword{
                    viewModel.register(withEmail: email, password: password, fullname: fullName)
                }else{
                    withAnimation {
                        viewModel.isError = true
                    }
                    viewModel.errorMessage = "Password not the same"
                }
                
            }label: {
                AuthMainButton(text: "SIGN UP")
                    .padding()
            }
            
            Text("OR")
                .foregroundColor(.black.opacity(0.5))
                .fontWeight(.bold)
                .font(.title3)
            
            VStack(spacing: 20){
                Button{
                    viewModel.googleSignIn()
                }label: {
                    SignWithMedia(text: "Login with Google", image: "Google")
                }
                
                
                
            }
            .padding()
            
            HStack{
                Text("Already have an account?")
                    .fontWeight(.regular)
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("SignIn")
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.regular)
                }
            }
            
        }
        .padding()
        .frame( maxWidth: .infinity, maxHeight: .infinity,  alignment: .top)
        .navigationBarTitle("Sign UP", displayMode: .automatic)
        
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthViewModel())
    }
}
