//
//  TabButtonView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct TabButtonView: View {
    var iconName: String
    var title: String
    var isSelected: Bool
    var primaryColor: Color
    var secondaryColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(title)
                    .fontWeight(.bold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? primaryColor : Color.clear)
            .foregroundColor(isSelected ? secondaryColor : primaryColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
    }
}
