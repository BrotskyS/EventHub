//
//  AuthMainButton.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct AuthMainButton: View {
    let text: String
    var body: some View {
        ZStack{
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.semibold)
            
            Image(systemName: "arrow.right")
                .padding(10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial, in: Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color("AccentColor"), in: RoundedRectangle(cornerRadius: 15))
    }
}

struct AuthMainButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthMainButton(text: "SIGN IN")
    }
}
