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
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("full name")
                .font(.caption2)
                .foregroundColor(.primary.opacity(0.4))
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("full name", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
            
            Text("username")
                .font(.caption2)
                .foregroundColor(.primary.opacity(0.4))
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("username", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

            Divider().padding(.vertical)
            
            Text("email")
                .font(.caption2)
                .foregroundColor(.primary.opacity(0.4))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("email", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

            Text("confirm email")
                .font(.caption2)
                .padding(.top)
                .foregroundColor(.primary.opacity(0.4))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("confirm email", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Save")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .modifier(ButtonFill())
            }
            .padding(.top)
            Spacer()
        }.padding(.horizontal)
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Ícone personalizado
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
    AccountInfoView()
}
