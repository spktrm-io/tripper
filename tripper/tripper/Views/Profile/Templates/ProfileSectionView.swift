//
//  ProfileSectionView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI
import ProgressIndicatorView

struct ProfileSectionView: View {
    var primaryColor: Color
    @State private var showProgressIndicator: Bool = true
    @State private var progress: CGFloat = 0.5
    
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
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            HStack{
                Text("1")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                ProgressIndicatorView(isVisible: $showProgressIndicator, type: .dashBar(progress: $progress, numberOfItems: 8, backgroundColor: .gray.opacity(0.5)))
                    .frame(height: 8.0)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                
                Text("2")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding()
            
            Divider()
                .padding(.bottom)
            
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

struct ProfileSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(bottomSpacer: 100)
    }
}
