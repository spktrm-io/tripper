//
//  TabButtonView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct TabButtonView: View {
    @Binding var selectedIndex: Int
    var primaryColor: Color
    var secondaryColor: Color
    
    var body: some View {
        HStack {
            Button(action: {
                selectedIndex = 0
            }) {
                HStack {
                    Image(systemName: "safari.fill")
                    Text("Discover")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(selectedIndex == 0 ? primaryColor : Color.clear)
                .foregroundColor(selectedIndex == 0 ? secondaryColor : primaryColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedIndex == 0 ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
                )
            }
            
            Spacer()
            
            Button(action: {
                selectedIndex = 1
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(selectedIndex == 1 ? primaryColor : Color.clear)
                .foregroundColor(selectedIndex == 1 ? secondaryColor : primaryColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedIndex == 1 ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal)
        .frame(maxHeight: 50)
    }
}
