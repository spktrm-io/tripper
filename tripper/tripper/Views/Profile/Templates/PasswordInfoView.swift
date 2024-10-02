//
//  PasswordInfoView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

// Exemplos de Views para navegação (placeholders)
struct PasswordInfoView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @State var searchText: String = ""
    
    var body: some View {
        VStack{
            Text("Password")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("password", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            TextField("confirm password", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Save")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .modifier(ButtonFill())
            }
            .padding([.horizontal, .top])
            Spacer()

        }
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
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
                    .modifier(ButtonFill())
                }
            }
        }
    }
}

#Preview {
    PasswordInfoView()
}
