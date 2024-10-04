//
//  SavedRoutes.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import SwiftUI

struct SavedRoutesView: View {
    let bottomSpacer: CGFloat?
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    private let edge: CGFloat
    private let columns: [GridItem]
    private let columnsPhotos = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let photos: [String] = ["andes", "andes-1", "andes-2", "andes-3"] // Array de nomes das imagens

    init(bottomSpacer: CGFloat) {
        self.edge = UIScreen.main.bounds.width * 0.40
        self.columns = [
            GridItem(.fixed(self.edge)),
            GridItem(.fixed(self.edge))
        ]
        self.bottomSpacer = bottomSpacer
    }
    
    var body: some View {
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
                                VStack(alignment: .center) {
                                    LazyVGrid(columns: columnsPhotos) {
                                        ForEach(photos, id: \.self) { photo in
                                            Image(photo)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                .clipped()
                                        }
                                    }
                                }
                                .frame(width: edge, height: edge)
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

struct SavedRoutesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoutesView(bottomSpacer: 100)
    }
}
