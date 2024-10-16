//
//  MainContentView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct MainContentView: View {
    @Binding var selectedIndex: Int
    @State var credentialIndex: Int = 0
    let bottomTabMenuHeight: CGFloat
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {
        ZStack {
            switch selectedIndex {
            case 0:
                ExploreView(bottomSpacer: bottomTabMenuHeight)
            case 1:
                TripView()
            case 2:
                SavedRoutesView(bottomSpacer: bottomTabMenuHeight)
            case 3:
                if isLoggedIn {
                    // Se o usuário está logado, vá para a ProfileView
                    ProfileView(bottomSpacer: bottomTabMenuHeight)
                } else {
                    // Se o usuário não está logado, mostre Login ou StepperView
                    switch credentialIndex {
                    case 0:
                        LoginView(selectedIndex: $credentialIndex)
                    case 1:
                        StepperView(selectedIndex: $credentialIndex)
                    default:
                        LoginView(selectedIndex: $credentialIndex)
                    }
                }
            default:
                ExploreView(bottomSpacer: bottomTabMenuHeight)
            }
        }
    }
}

#Preview {
    MainContentView(selectedIndex: .constant(1), bottomTabMenuHeight: 100)
        .environmentObject(LocationService(completer: .init()))
        .environmentObject(ColorSchemeManager())

}
