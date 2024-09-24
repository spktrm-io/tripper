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
    let bottomSpacer: CGFloat?

    var body: some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
       
         let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        NavigationView{
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
                
                ScrollView (showsIndicators: false){
                    if selectedIndex == 0 {
                        ProfileSectionView(primaryColor: primaryColor)
                    } else {
                        SettingsSectionView(primaryColor: primaryColor)
                    }
                    Spacer()
                        .frame(minHeight: bottomSpacer)
                        .fixedSize()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(bottomSpacer: 100)
    }
}
