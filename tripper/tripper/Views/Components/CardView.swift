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
    let edge: CGFloat = UIScreen.main.bounds.width * 0.85
    let photos: [String] = ["andes", "andes-1", "andes-2", "andes-3"] // Array de nomes das imagens
    
    var body: some View {
        NavigationLink(destination: RouteDetailView()) {
            VStack{
                TabView {
                    ForEach(photos, id: \.self) { photo in
                        Image(photo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle()) // Define o estilo de carrossel
                .indexViewStyle(PageIndexViewStyle()) // Mostra os indicadores de página
                .frame(width: edge, height: edge) // Define o tamanho da imagem
                .cornerRadius(15)
                .padding(.bottom, 6)
                
                HStack{
                    VStack(alignment: .leading, spacing: 5) {
                        // Título da viagem
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        // Descrição
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2) // Limita o número de linhas para evitar overflow
                        
                        // Duração da viagem
                        Text("Duration: \(duration)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack(spacing: 5) {
                        if let rating = rating {
                            Image(systemName: "star.fill")
                            Text("\(rating)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .frame(width: edge, alignment: .leading)
            }
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
}
