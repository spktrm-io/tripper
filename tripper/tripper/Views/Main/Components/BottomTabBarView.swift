//
//  BottomTabBarView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct BottomTabBarView: View {
    @Binding var selectedIndex: Int
    var primaryColor: Color
    var secondaryColor: Color
    var bottomTabMenuHeight: CGFloat

    var body: some View {
        HStack {
            Spacer()
            BottomTabBarButtonView(iconName: "map.fill", title: "Home", isSelected: selectedIndex == 0, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                selectedIndex = 0
            }
            Spacer()
            BottomTabBarButtonView(iconName: "safari.fill", title: "Explore", isSelected: selectedIndex == 1, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                selectedIndex = 1
            }
            Spacer()
            BottomTabBarButtonView(iconName: "bookmark.fill", title: "Saved", isSelected: selectedIndex == 2, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                selectedIndex = 2
            }
            Spacer()
            BottomTabBarButtonView(iconName: "person.crop.circle.fill", title: "Profile", isSelected: selectedIndex == 3, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                selectedIndex = 3
            }
            Spacer()
        }
        .padding()
        .padding(.bottom, 30)
        .frame(height: bottomTabMenuHeight)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}
