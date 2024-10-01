//
//  AppearanceView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("selectedTheme") private var selectedTheme = 2 // Store theme choice globally
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        VStack(spacing: 20) {
            Text("Appearance")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Light theme button
            Button(action: {
                selectedTheme = 0
                applyTheme(theme: 0) // Apply theme when button is clicked
            }) {
                VStack {
                    Image("tripper-logo-light-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedTheme == 0 ? Color.blue : Color.primary.opacity(0.3), lineWidth: selectedTheme == 0 ? 10 : 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
            
            // Dark theme button
            Button(action: {
                selectedTheme = 1
                applyTheme(theme: 1) // Apply theme when button is clicked
            }) {
                VStack {
                    Image("tripper-logo-dark-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .shadow(radius: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedTheme == 1 ? Color.blue : Color.primary.opacity(0.3), lineWidth: selectedTheme == 1 ? 10 : 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
            
            // System theme button
            Button(action: {
                selectedTheme = 2
                applyTheme(theme: 2) // Apply theme when button is clicked
            }) {
                VStack {
                    Image("tripper-logo-system")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.clear)
                        .shadow(radius: 5)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedTheme == 2 ? Color.blue : Color.primary.opacity(0.3), lineWidth: selectedTheme == 2 ? 10 : 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .modifier(ButtonFill())
                }
            }
        }
    }
    
    // Function to apply the theme based on the selected value
    func applyTheme(theme: Int) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        switch theme {
        case 0:
            // Apply light theme
            windowScene.windows.first?.overrideUserInterfaceStyle = .light
        case 1:
            // Apply dark theme
            windowScene.windows.first?.overrideUserInterfaceStyle = .dark
        case 2:
            // Apply system theme
            windowScene.windows.first?.overrideUserInterfaceStyle = .unspecified
        default:
            break
        }
    }
}

#Preview {
    AppearanceView()
}
