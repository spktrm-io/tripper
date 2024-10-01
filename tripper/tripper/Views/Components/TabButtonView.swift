//
//  TabButtonView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct TabButtonView: View {
    var iconName: String
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(title)
                    .fontWeight(.bold)
            }
            .modifier(ButtonToggle(isSelected: isSelected))
        }
    }
}
