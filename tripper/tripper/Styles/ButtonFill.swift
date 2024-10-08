//
//  ButtonFill.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct ButtonFill: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var buttonColor: Color = Color.primary
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 16

    func body(content: Content) -> some View {
        let textColor: Color = colorScheme == .dark ? Color.black : Color.white
        content
            .padding(padding)
            .background(buttonColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
    }
}
