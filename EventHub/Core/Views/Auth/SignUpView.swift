//
//  SignUpView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ScrollView{
            
            VStack{
                CustomField(text: $email, icon: "person", placeholder: "Full name")
                
                CustomField(text: $password, icon: "envelope", placeholder: "abc@gmail.com")
                CustomField(text: $password, icon: "lock", isSecure: true, placeholder: "Password")
                CustomField(text: $password, icon: "lock", isSecure: true, placeholder: "Confirm password")
            }
            .padding(1)
            
            
            
            Button{
                
            }label: {
                AuthMainButton(text: "SIGN UP")
                    .padding()
            }
            
            Text("OR")
                .foregroundColor(.black.opacity(0.5))
                .fontWeight(.bold)
                .font(.title3)
            
            VStack(spacing: 20){
                SignWithMedia(text: "Login with Google", image: "Google")
                
                SignWithMedia(text: "Login with Facebook", image: "Facebook")
                
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
    }
}
