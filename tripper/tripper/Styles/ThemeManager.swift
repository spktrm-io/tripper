//
//  ThemeManager.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false
    
    var primary: Color {
        isDarkMode ? Color.black : Color.white
    }
    
    var secondary: Color {
        isDarkMode ? Color.white : Color.black
    }
    
    var textColor: Color {
        isDarkMode ? Color.white : Color.black
    }
    
    var accentColor: Color {
        isDarkMode ? Color.orange : Color.blue
    }
}
