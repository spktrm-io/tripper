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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        VStack{
            VStack{ // Header ao qual que quero que seja sticky
                HStack {
                    Image(logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Spacer()
                    LocationButtonView(isSheetPresented: $isSheetPresented, buttonContentColor: buttonContentColor)
                    
                }
                .padding(.horizontal)
                
                HStack{
                    SearchBarView(searchText: $searchText)
                    Button(action:{isSheetPresented.toggle()}){
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    .modifier(ButtonBlank(cornerRadius: 10))
                    Button(action:{isSheetPresented.toggle()}){
                        Image(systemName: "plus")
                    }
                    .modifier(ButtonFill())
                }
                .padding()
                // ate aqui some ao fazer scroll
                
                ToggleButtonsView() // esse fica no scroll
                
                Divider()
                    .padding(.top, 7)
                    .padding(.bottom, -10)
            }
            
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
        .environmentObject(LocationService(completer: .init()))
}
