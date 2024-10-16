//
//  SavedRoutes.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import SwiftUI

struct SavedRoutesView: View {
    let bottomSpacer: CGFloat?
    private let edge: CGFloat
    private let columns: [GridItem]
    let spacing: CGFloat = 4
    let photos: [String] = ["andes", "andes-1", "andes-2", "andes-3"]
    
    init(bottomSpacer: CGFloat) {
        self.edge = UIScreen.main.bounds.width * 0.40
        self.columns = [
            GridItem(.fixed(self.edge)),
            GridItem(.fixed(self.edge))
        ]
        self.bottomSpacer = bottomSpacer
    }
    
    var body: some View {
        let columnsPhotos = [
            GridItem(.flexible(), spacing: spacing), // Espaçamento entre colunas
            GridItem(.flexible(), spacing: spacing)
        ]
        
        VStack(alignment: .leading) {
            Text("Saved routes")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(0..<10) { _ in
                        Button(action: {}) {
                            VStack{
                                LazyVGrid(columns: columnsPhotos, spacing: 2) {
                                    ForEach(photos, id: \.self) { photo in
                                        Image(photo)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: edge / 2, height: edge / 2)
                                            .clipped()
                                    }
                                }
                                .frame(width: edge, height: edge)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                                )
                                
                                Text("Collection")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("2 saved")
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                Spacer(minLength: bottomSpacer)
                
            }
            Spacer()
        }
        .padding()
    }
}

#Preview{
    SavedRoutesView(bottomSpacer: 100)
}
