//
//  ProfileSectionView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI


struct ProfileSectionView: View {
    var primaryColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4)
                )
            Text("@rckbrcls")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Divider()
                .padding(.vertical)
            
            Text("General vision")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            StatisticsGridView(primaryColor: primaryColor)
            
            MedalsView()
        }
        .padding(.top)
    }
}
