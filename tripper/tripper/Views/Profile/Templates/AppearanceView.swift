//
//  AppearanceView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isOn = false // Estado do switch
    
    var body: some View {
        VStack {
            
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
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}
