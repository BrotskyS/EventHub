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
            Image("logo")
                .resizable()
                .frame(width: 55, height: 55)
            Text("EventHub")
                .font(.largeTitle)
                .foregroundColor(.black.opacity(0.7))
                .fontWeight(.semibold)
            
            Text("Sign In")
                .font(.title)
                .foregroundColor(.black.opacity(0.8))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CustomField(text: $email, icon: "envelope", placeholder: "abc@email.com")
                .padding(.vertical)
            CustomField(text: $password, icon: "key", isSecure: true, placeholder: "Password")
            
            HStack{
//
//                Toggle("", isOn: .constant(false))
//
//                    .frame(width: 60,  alignment: .leading)
//                    .padding(0)
//
//
//                Text("Remember me?")
                Spacer()
                Button{
                    
                }label: {
                    Text("Forgot password?")
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical)
        
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
