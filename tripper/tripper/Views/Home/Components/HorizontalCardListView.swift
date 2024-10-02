//
//  HorizontalCardListView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct HorizontalCardListView: View {
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            let availableHeight = geometry.size.height - 100
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(0..<5) { index in
                            CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.leading, 10)
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(10)
            }
            .padding(.vertical)
        }
    }
}
