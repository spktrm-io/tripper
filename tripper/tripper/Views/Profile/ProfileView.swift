//
//  ProfileView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedIndex: Int = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
       

         let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        VStack {
            HStack {
                TabButtonView(iconName: "staroflife.fill", title: "Me", isSelected: selectedIndex == 0, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                    selectedIndex = 0
                }
                Spacer()
                TabButtonView(iconName: "gear", title: "Settings", isSelected: selectedIndex == 1, primaryColor: primaryColor, secondaryColor: secondaryColor) {
                    selectedIndex = 1
                }
            }
            
            ScrollView {
                if selectedIndex == 0 {
                    ProfileSectionView(primaryColor: primaryColor)
                } else {
                    SettingsSectionView(primaryColor: primaryColor)
                }
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
