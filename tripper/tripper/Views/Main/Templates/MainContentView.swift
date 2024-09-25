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
                HomeView(bottomSpacer: bottomTabMenuHeight)
            case 1:
                CreateNewRouteView()
                    .padding(.bottom, bottomTabMenuHeight)
            case 2:
                SavedRoutesView()
                    .padding(.bottom, bottomTabMenuHeight)
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
                HomeView(bottomSpacer: bottomTabMenuHeight)
            }
        }
    }
}

#Preview {
    MainContentView(selectedIndex: .constant(3), bottomTabMenuHeight: 100)
}
