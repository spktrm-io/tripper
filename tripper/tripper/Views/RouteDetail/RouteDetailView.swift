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
         let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        

            VStack {
                Text("RouteDetailView")
            }
            .padding(.horizontal).navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
        
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                    }) {
                        HStack {
                            Image(systemName: "chevron.left") // Ícone personalizado
                            Text("Back")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primary)
                        .foregroundColor(secondaryColor)
                        .cornerRadius(10)
                    }
                }
            }
        }

}

#Preview{
    ProfileView(bottomSpacer: 100)
}

