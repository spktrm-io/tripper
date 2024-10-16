//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 16/10/24.
//

import SwiftUI

struct LocationButtonView: View {
    @EnvironmentObject var locationService: LocationService
    @Binding var isSheetPresented: Bool
    var buttonContentColor: Color
    
    var body: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            Image(systemName: "mappin")
            Text(locationService.currentCity ?? "Searching...")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .padding()
        .foregroundColor(buttonContentColor)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
        .environmentObject(ColorSchemeManager())
}
