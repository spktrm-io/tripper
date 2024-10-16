//
//  ButtonBlank.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct BoxBlankStyle: ViewModifier {
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 16
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .foregroundColor(colorSchemeManager.primaryColor)
            .fontWeight(.bold)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
    }
}
