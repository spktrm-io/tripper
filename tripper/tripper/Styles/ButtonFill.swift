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
    
    func body(content: Content) -> some View {
        let textColor: Color = colorScheme == .dark ? Color.black : Color.white
        content
            .padding()
            .background(buttonColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
