//
//  SignInView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        
        VStack{
            
            CustomField(text: $email, icon: "envelope", placeholder: "abc@email.com")
                .padding(.vertical)
            CustomField(text: $password, icon: "lock", isSecure: true, placeholder: "Password")
            
            HStack{
                Spacer()
                NavigationLink(destination: ResetPassword()) {
                    Text("Forgot password?")
                        .foregroundColor(.black)
                }
                
            }
            .padding(.vertical)
            
            
            Button{
                
            }label: {
                AuthMainButton(text: "SIGN IN")
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
                Text("Don’t have an account?")
                    .fontWeight(.regular)
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.regular)
                }
            }
            
            
        }
        
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarTitle("Sign In")
        .padding()
    }
    
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
