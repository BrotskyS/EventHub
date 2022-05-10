//
//  AuthBackground.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

struct AuthBackground: View {
    var body: some View {
        VStack{
            Circle()
                .fill(.pink)
                .frame(width: 150, height: 150)
                .offset(x: 50, y: -100)
            
            Spacer()
        
            HStack{
                Circle()
                    .fill(Color("AccentColor"))
                    .frame(width: 200, height: 200)
                    .offset(x: -200, y: 50)
                Circle()
                    .fill(Color("AccentColor"))
                    .frame(width: 200, height: 200)
                    .offset(x: 200)
            }
        }
        .blur(radius: 200)
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AuthBackground_Previews: PreviewProvider {
    static var previews: some View {
        AuthBackground()
    }
}
