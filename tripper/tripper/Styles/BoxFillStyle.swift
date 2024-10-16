//
//  ButtonFill.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct BoxFillStyle: ViewModifier {
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager
    var buttonColor: Color = Color.primary
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 16

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(buttonColor)
            .foregroundColor(colorSchemeManager.secondaryColor)
            .cornerRadius(cornerRadius)
    }
}
