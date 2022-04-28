//
//  ResetPassword.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct ResetPassword: View {
    @State private var email = ""
    
    var body: some View {
            VStack(alignment: .leading){
                
                Text("Please enter your email address to \nrequest a password reset")
                    .font(.subheadline)
                    .padding(.vertical)
                       
                CustomField(text: $email, icon: "envelope", placeholder: "abc@gmail.com")
                
                Button{
                    
                }label: {
                    AuthMainButton(text: "SIGN UP")
                        .padding()
                }
                .padding(.vertical)
               
                
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Resset Password")
        }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
