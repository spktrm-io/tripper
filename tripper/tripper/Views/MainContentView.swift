//
//  MainContentView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct MainContentView: View {
    @Binding var selectedIndex: Int
    let bottomTabMenuHeight: CGFloat

    var body: some View {
        ZStack {
            switch selectedIndex {
            case 0:
                HomeView(bottomSpacer: bottomTabMenuHeight)
            case 1:
                CreateNewRouteView()
                    .padding(.bottom, bottomTabMenuHeight)
            case 2:
                SavedRoutesView()
                    .padding(.bottom, bottomTabMenuHeight)
            case 3:
                ProfileView()
            default:
                HomeView(bottomSpacer: bottomTabMenuHeight)
            }
        }
    }
}
