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

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(locationService) // Provide the LocationService to the environment
        }
    }
}
