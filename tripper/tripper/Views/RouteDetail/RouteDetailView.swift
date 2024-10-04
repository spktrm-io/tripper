//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 25/09/24.
//

import SwiftUI

struct RouteDetailView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack(){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                    }
                    .frame(width: 40, height: 40)
                    .modifier(ButtonBlank(cornerRadius: .infinity, padding: 4))
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
                        
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview{
    RouteDetailView()
}

