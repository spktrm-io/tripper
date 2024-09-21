//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            SearchBarView(searchText: $searchText)
            ToggleButtonsView()
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<5) { index in
                    CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                }
            }
            .padding(.vertical)
        }
    }
}
