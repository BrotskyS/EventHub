//
//  StrokeStyle.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI

struct StrokeModifier: ViewModifier {
    var cornerRadius: CGFloat = 30.0
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(.linearGradient(colors: [.black, .black], startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
            )
        
    }
}

extension View{
    func strokeStyle(cornerRadius: CGFloat = 30.0) -> some View {
        modifier(StrokeModifier(cornerRadius: cornerRadius))
    }
}
