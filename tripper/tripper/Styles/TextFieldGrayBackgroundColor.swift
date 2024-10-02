//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 30/09/24.
//

import SwiftUI

struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(.primary.opacity(0.05))
            .cornerRadius(.infinity)
            .foregroundColor(.primary)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
    }
}


#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
}
