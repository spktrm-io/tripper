//
//  SearchBarView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Where you want to go?", text: $searchText)
        }
        .modifier(TextFieldGrayBackgroundColor())
    }
}


#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
        .environmentObject(ColorSchemeManager())
}

