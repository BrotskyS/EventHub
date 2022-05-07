//
//  ProfileButton.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 07.05.2022.
//

import SwiftUI

struct ProfileButton: View {
    var image: String
    var title: String
    var isFill: Bool
    var body: some View {
        if isFill{
            HStack{
                Image(systemName: image)
                Text(title)
            }
            .foregroundColor( .white)
            .padding(.vertical)
            .frame(width: 145)
            .background(Color("AccentColor"), in: RoundedRectangle(cornerRadius: 10))
        }else{
            HStack{
                Image(systemName: image)
                Text(title)
            }
            .foregroundColor(isFill ? .white :  Color("AccentColor"))
            .padding(.vertical)
            .frame(width: 145)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("AccentColor"), lineWidth: 1)
            )
           
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(image: "message.fill", title: "Message", isFill: true)
    }
}
