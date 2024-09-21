//
//  BottomTabBarButtonView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct BottomTabBarButtonView: View {
    var iconName: String
    var title: String
    var isSelected: Bool
    var primaryColor: Color
    var secondaryColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                if isSelected { // Exibe o texto apenas se selecionado
                    Text(title)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(isSelected ? primaryColor : Color.clear) // Fundo preto quando selecionado
            .foregroundColor(isSelected ? secondaryColor : primaryColor) // Muda a cor do ícone e do texto
            .cornerRadius(10) // Borda arredondada
        }
    }
}
