//
//  CustomField.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI

struct CustomField: View {
    @Binding var text: String
    var icon: String = ""
    var isSecure: Bool = false
    var placeholder: String = ""
    
    @State private var isShowSecureField = true
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.black.opacity(0.4))
                .font(.title3)
            if isShowSecureField && isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(.black.opacity(0.4))
            }else{
                TextField(placeholder, text: $text)
                    .foregroundColor(.black.opacity(0.4))
            }
        
            if isSecure{
                Button{
                    isShowSecureField.toggle()
                }label: {
                    Image(systemName: isShowSecureField ? "eye.slash" : "eye")
                        .foregroundColor(.black.opacity(0.4))
                        .font(.title3)
                }
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.black.opacity(0.3), lineWidth: 1)
        )
    }
}

struct CustomField_Previews: PreviewProvider {
    static var previews: some View {
        CustomField(text: .constant(""), icon: "key", isSecure: true)
    }
}
