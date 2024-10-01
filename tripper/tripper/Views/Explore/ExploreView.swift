//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    
    var body: some View {
        VStack{
            HStack{
                SearchBarView(searchText: $searchText)
                Button(action:{isSheetPresented.toggle()}){
                    Image(systemName: "line.3.horizontal.decrease")
                }
                .modifier(ButtonBlank())
            }
            .padding(.trailing)
            ToggleButtonsView()
            Divider()
                .padding(.top, 7)
                .padding(.bottom, -10)
            
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
        }.sheet(isPresented: $isSheetPresented) {
            VStack {
                
            }
            .padding()
            .presentationDetents([.large])
            .presentationBackground(.ultraThinMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
}
