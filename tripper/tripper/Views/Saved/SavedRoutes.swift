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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Saved routes")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            ScrollView(showsIndicators: false) {
                                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<5) { index in
                        CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                    }
                }
                .padding(.vertical)
                Spacer()
                    .frame(minHeight: bottomSpacer)
                    .fixedSize()
            }
        }
        .padding(.vertical)
    }
}

struct SavedRoutesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRoutesView(bottomSpacer: 100)
    }
}
