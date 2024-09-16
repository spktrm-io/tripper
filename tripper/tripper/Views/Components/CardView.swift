//
//  CardView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    var title: String
    var description: String
    let cardWidth = UIScreen.main.bounds.width * 0.85
    let cardHeight = UIScreen.main.bounds.height * 0.55
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
        
            Image("andes")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardWidth, height: cardHeight) // Define o tamanho da imagem
                .clipped()
            
            // Conteúdo do card (textos) sobre a imagem
            HStack{
                VStack(alignment: .leading, spacing: 10) { // Alinha o conteúdo à esquerda
                    Text(title)
                        .font(.system(size: 36, weight: .black)) // Aumenta o tamanho do título
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial) // Aplica o fundo translúcido ao VStack
            .cornerRadius(10)
            .padding([.leading, .trailing, .bottom], 10) // Espaçamento para não ficar colado nas bordas do card
        }
        .frame(width: cardWidth, height: cardHeight) // Define a largura e altura do card
        .cornerRadius(15) // Bordas arredondadas
        .padding(.trailing, 20) // Espaçamento entre os cards
    }
}
