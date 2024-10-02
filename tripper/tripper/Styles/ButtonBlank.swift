//
//  ButtonBlank.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct ButtonBlank: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var cornerRadius: CGFloat = 10
    
    func body(content: Content) -> some View {
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        content
            .padding()
            .foregroundColor(buttonContentColor)
            .fontWeight(.bold)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
    }
}
