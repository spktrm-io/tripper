//
//  tripperApp.swift
//  tripper
//
//  Created by Erick Barcelos on 26/08/24.
//

import SwiftUI

@main
struct tripperApp: App {
    @StateObject private var themeManager = ThemeManager() // Instancia o gerenciador de temas

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(themeManager) // Passa o tema como um EnvironmentObject
        }
    }
}
