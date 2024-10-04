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
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let edge: CGFloat = UIScreen.main.bounds.width * 0.40
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Saved routes")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<10) { _ in
                        Button(action: {}) {
                            VStack{
                                VStack(alignment: .leading) {
                                    
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
                            .padding(.horizontal)
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
