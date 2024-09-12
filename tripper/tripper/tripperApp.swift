//
//  tripperApp.swift
//  tripper
//
//  Created by Erick Barcelos on 26/08/24.
//

import SwiftUI

@main
struct tripperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
