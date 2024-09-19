//
//  ProfileView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedIndex: Int = 0 // Índice do item selecionado
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme

    var body: some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        VStack{
            HStack {
                Button(action: {
                    selectedIndex = 0
                }) {
                    HStack {
                        Image(systemName: "staroflife.fill")
                        Text("Me")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // O botão ocupa todo o espaço disponível
                    .background(selectedIndex == 0 ? primaryColor : Color.clear)
                    .foregroundColor(selectedIndex == 0 ? secondaryColor : primaryColor)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                         .stroke(selectedIndex == 0 ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
                     )
                }
                Spacer()
                Button(action: {
                    selectedIndex = 1
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // O botão ocupa todo o espaço disponível
                    .background(selectedIndex == 1 ? primaryColor : Color.clear) // Fundo preto quando selecionado
                    .foregroundColor(selectedIndex == 1 ? secondaryColor : primaryColor) // Muda a cor do ícone e do texto
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                         .stroke(selectedIndex == 1 ? Color.clear : Color.primary.opacity(0.1), lineWidth: 1)
                     )
                }
                
            }
            .padding(.bottom)
            
            switch selectedIndex {
            case 0:
                VStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill() // Preenche o espaço mantendo a proporção
                        .frame(width: 100, height: 100) // Tamanho do avatar
                        .clipShape(Circle()) // Torna a imagem circular
                        .overlay(
                            Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                        )
                    Text("@rckbrcls")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
              
                Divider()
                    .padding(.vertical)
                
                Spacer()
            case 1:
                Spacer()
            default:
                VStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill() // Preenche o espaço mantendo a proporção
                        .frame(width: 100, height: 100) // Tamanho do avatar
                        .clipShape(Circle()) // Torna a imagem circular
                        .overlay(
                            Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                        )
                    Text("@rckbrcls")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
              
                Divider()
                    .padding(.vertical)
                
                Spacer()
            }
        
           
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
