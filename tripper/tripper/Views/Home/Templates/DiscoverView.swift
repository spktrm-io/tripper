//
//  DiscoverView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchText: String = ""
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        VStack{
            HStack {
                Image(logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Spacer()
                LocationButtonView(isSheetPresented: $isSheetPresented, buttonContentColor: buttonContentColor)
                
            }
            .padding(.horizontal)
            ToggleButtonsView()
            
            
            Divider()
                .padding(.top, 7)
                .padding(.bottom, -10)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
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
    DiscoverView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
}
