//
//  tripperApp.swift
//  tripper
//
//  Created by Erick Barcelos on 26/08/24.
//

import SwiftUI

@main
struct tripperApp: App {
    @StateObject private var locationService = LocationService(completer: .init())
    @StateObject private var colorSchemeManager = ColorSchemeManager()
    @AppStorage("selectedTheme") private var selectedTheme = 2
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(locationService)
                .environmentObject(colorSchemeManager)
                .onAppear {
                    applyTheme()
                }
        }
    }
    
    func applyTheme() {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                return
            }
            
            switch selectedTheme {
            case 0:
                // Aplica o tema claro
                windowScene.windows.first?.overrideUserInterfaceStyle = .light
            case 1:
                // Aplica o tema escuro
                windowScene.windows.first?.overrideUserInterfaceStyle = .dark
            case 2:
                // Aplica o tema do sistema
                windowScene.windows.first?.overrideUserInterfaceStyle = .unspecified
            default:
                break
            }
        }
}
