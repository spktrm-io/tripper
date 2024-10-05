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
            Text("Password")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
            
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("password")
                .font(.caption2)
                .padding(.top)
                .foregroundColor(.primary.opacity(0.4))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("password", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
            
            Text("confirm password")
                .font(.caption2)
                .padding(.top)
                .foregroundColor(.primary.opacity(0.4))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("confirm password", text: $searchText)
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
            .padding([ .top])
            Spacer()
            
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
    }
}

#Preview {
    PasswordInfoView()
}
