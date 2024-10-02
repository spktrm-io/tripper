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
    let typeOfTrips = [
        [
            "type": "Scenic",
            "image": "mountain.2.fill",
        ],
        [
            "type": "Fast",
            "image": "hare.fill",
        ],
        [
            "type": "Adventure",
            "image": "flame.fill",
        ],
        [
            "type": "Relaxing",
            "image": "sun.max.fill",
        ],
        [
            "type": "Cultural",
            "image": "book.fill",
        ],
        [
            "type": "Gastronomic",
            "image": "fork.knife",
        ],
        [
            "type": "Shopping",
            "image": "cart.fill",
        ],
        [
            "type": "Historical",
            "image": "clock.fill",
        ],
        [
            "type": "Nature",
            "image": "leaf.fill",
        ],
        [
            "type": "Sporty",
            "image": "sportscourt.fill",
        ],
        [
            "type": "Beach",
            "image": "beach.umbrella.fill",
        ]
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) { // Espaçamento entre os botões
                ForEach(Array(typeOfTrips.enumerated()), id: \.offset) { index, item in
                    // Extrair as propriedades do item
                    let type = item["type"] ?? ""
                    let imageName = item["image"] ?? ""
                    
                    Button(action: {
                        // Define o botão selecionado. Se for o mesmo, deseleciona.
                        selectedIndex = index
                    }) {
                        let textColor: Color = colorScheme == .dark ? Color.black : Color.white
                        
                        HStack {
                            Image(systemName: imageName)
                            Text(type)
                        }
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
            .padding(.horizontal)
        }
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
}
