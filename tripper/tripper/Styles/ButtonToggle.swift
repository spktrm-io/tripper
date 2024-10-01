//
//  ButtonToggle.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct ButtonToggle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? primaryColor : Color.clear)
            .foregroundColor(isSelected ? secondaryColor : primaryColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
            )
    }
}
