//
//  SignWithMedia.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct SignWithMedia: View {
    let text: String
    let image: String
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: 26, height: 26)
            Text(text)
                .font(.title2)
//                .fontWeight(.thin)
                .foregroundColor(.black)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(.black.opacity(0.05), in: RoundedRectangle(cornerRadius: 15))
        .strokeStyle(cornerRadius: 15)
        
        
    }
}

struct SignWithMedia_Previews: PreviewProvider {
    static var previews: some View {
        SignWithMedia(text: "Login with Google", image: "Google")
    }
}
