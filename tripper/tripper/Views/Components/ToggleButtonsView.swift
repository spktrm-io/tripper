//
//  ToggleButtonsView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import Foundation
import SwiftUI

struct ToggleButtonsView: View {
    @State private var selectedIndex: Int? = 0 // Índice do botão selecionado (inicia como nil)
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) { // Espaçamento entre os botões
                ForEach(0..<5, id: \.self) { index in
                    Button(action: {
                        // Define o botão selecionado. Se for o mesmo, deseleciona.
                        selectedIndex = selectedIndex == index ? nil : index
                    }) {
                        let textColor: Color = colorScheme == .dark ? Color.black : Color.white

                        Text("Button \(index + 1)")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .fontWeight(.bold)
                            .background(selectedIndex == index ? Color.primary : Color.clear)
                            .foregroundColor(selectedIndex == index ? textColor : Color.primary)
                            .cornerRadius(10)
                            .overlay(
                               RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedIndex == index ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
                            )
                    }
                }
            }
        }
    }
}
