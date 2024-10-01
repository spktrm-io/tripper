//
//  LocationButtonView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
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
        }
        .padding()
        .foregroundColor(buttonContentColor)
        .fontWeight(.bold)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
    }
}
