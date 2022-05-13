//
//  TextFieldStyle.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 13.05.2022.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("Background"), in: RoundedRectangle(cornerRadius: 10))
            
        
    }
}


extension View{
    func textFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
 
}
