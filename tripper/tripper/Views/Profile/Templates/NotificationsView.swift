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
            HStack(){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                    .frame(width: 40, height: 40)
                    .modifier(ButtonBlank(cornerRadius: .infinity, padding: 4))
                }
                Spacer()
            }
            Text("Notifications")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
          
            Toggle("Push", isOn: $isOn)
                .font(.subheadline)
                .toggleStyle(SwitchToggleStyle()) // Estilo de switch
                .padding(.top)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NotificationsView()
}
