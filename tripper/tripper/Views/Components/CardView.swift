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
    var duration: String = "2 days, 2h"
    var rating: String? = "0.0"
    var isVertical: Bool = true // Define se o card é vertical ou horizontal
    let cardWidth: CGFloat
    let cardHeight: CGFloat

    init(title: String, description: String, isVertical: Bool = true, rating: String? = "0.0", cardHeight: CGFloat = UIScreen.main.bounds.height * 0.50, cardWidth: CGFloat = UIScreen.main.bounds.width * 0.90) {
        self.title = title
        self.description = description
        self.isVertical = isVertical
        self.rating = rating
        self.cardHeight = cardHeight
        
        if isVertical {
            self.cardWidth = cardWidth
        } else {
            self.cardWidth = UIScreen.main.bounds.width * 0.85
        }
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
        
            Image("andes")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardWidth, height: cardHeight) // Define o tamanho da imagem
                .clipped()
            
            VStack {
                HStack {
                    Text(duration)
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.white)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding([.leading, .trailing, .top], 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                            .font(.system(size: 36, weight: .black))
                            .foregroundColor(.white)
                        
                        Text(description)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    if let rating = rating {
                        Text(rating)
                            .font(.system(size: 36, weight: .black))
                            .foregroundColor(.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                            )
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding([.leading, .trailing, .bottom], 10)
            }
        }
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(15)
        .padding(isVertical ? .bottom : .trailing, 20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(title: "Vertical Card", description: "Descrição do card", isVertical: true, rating: "5.0")
            CardView(title: "Horizontal Card", description: "Descrição do card", isVertical: false)
        }
    }
}
