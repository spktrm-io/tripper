//
//  MedalsView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct MedalsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Medals")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {}) {
                    Text("see all")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    MedalButton(imageName: "medal-ship")
                    MedalButton(imageName: "medal-airplane")
                    MedalButton(imageName: "medal-starship")
                    MedalButton(imageName: "medal-beach")
                    MedalButton(imageName: "medal-mars")
                    MedalButton(imageName: "medal-montain")
                    MedalButton(imageName: "medal-moon")
                }
                .padding([.leading, .trailing], 20)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
    }
}

struct MedalButton: View {
    var imageName: String
    
    var body: some View {
        Button(action: {}) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4)
                )
        }
    }
}
