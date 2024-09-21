//
//  SettingsSectionView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct SettingsSectionView: View {
    var primaryColor: Color
    
    var body: some View {
        VStack {
            Text("Personal")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            SettingOptionButton(iconName: "person", title: "Account information", primaryColor: primaryColor)
            SettingOptionButton(iconName: "house.fill", title: "Address information", primaryColor: primaryColor)
            
            Text("General")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            SettingOptionButton(iconName: "circle.grid.3x3.fill", title: "Apparence", primaryColor: primaryColor)
            SettingOptionButton(iconName: "bell.fill", title: "Notifications", primaryColor: primaryColor)
            
            Text("Support")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            SettingOptionButton(iconName: "exclamationmark.triangle.fill", title: "Report a error", primaryColor: primaryColor)
            SettingOptionButton(iconName: "questionmark.circle", title: "FAQ", primaryColor: primaryColor)
            
            Divider()
                .padding(.vertical)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Logout")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct SettingOptionButton: View {
    var iconName: String
    var title: String
    var primaryColor: Color
    
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .center) {
                Image(systemName: iconName)
                    .foregroundStyle(primaryColor)
                Text(title)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(primaryColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
    }
}
