//
//  AccountInfoView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

// Exemplos de Views para navegação (placeholders)
struct AccountInfoView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @State var searchText: String = ""

    var body: some View {
        VStack{
            Text("Account information")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    
            TextField("full name", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
        
            TextField("username", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Divider().padding()
            
            TextField("email", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            TextField("confirm email", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Save")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
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
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    AccountInfoView()
}
