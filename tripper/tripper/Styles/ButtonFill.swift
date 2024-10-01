//
//  ButtonFill.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct ButtonFill: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        let textColor: Color = colorScheme == .dark ? Color.black : Color.white
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.primary)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
