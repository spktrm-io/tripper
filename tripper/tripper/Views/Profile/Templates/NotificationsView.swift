//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isOn: Bool = false

    var body: some View {
        
        VStack {
            Text("Notifications")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
          
            Toggle("Push", isOn: $isOn)
                .font(.subheadline)
                .toggleStyle(SwitchToggleStyle()) // Estilo de switch
                .padding()
            
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
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    .modifier(ButtonFill())
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
