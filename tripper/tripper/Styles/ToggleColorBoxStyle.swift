//
//  ButtonToggle.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct ToggleColorBoxStyle: ViewModifier {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? colorSchemeManager.primaryColor : Color.clear)
            .foregroundColor(isSelected ? colorSchemeManager.secondaryColor : colorSchemeManager.primaryColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
            )
    }
}
