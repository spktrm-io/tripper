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
                
                Text("General vision")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                let columns = [
                    GridItem(.flexible(), spacing: 10),
                    GridItem(.flexible(), spacing: 10)
                ]

                LazyVGrid(columns: columns, spacing: 10) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "car.fill")
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                            Text("100.000 KM")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.leading, 8) // Adiciona espaço entre a imagem e o texto
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("kilometers")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                    )

                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "road.lanes")
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                            Text("100 routes")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.leading, 8) // Adiciona espaço entre a imagem e o texto
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("routes made")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                    )

                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "medal.fill")
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                            Text("Gold")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.leading, 8) // Adiciona espaço entre a imagem e o texto
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("your ranking")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                    )

                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "text.book.closed.fill")
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                            Text("10 saveds")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.leading, 8) // Adiciona espaço entre a imagem e o texto
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Text("routes saved")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                    )
                }
                
                Text("Medals")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.primary)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            
                ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                    HStack(alignment: .center, spacing: 20) { // Remove o espaçamento padrão
                        ForEach(0..<10) { index in
                            VStack{
                                Image("image")
                                    .resizable()
                                    .scaledToFill() // Preenche o espaço mantendo a proporção
                                    .frame(width: 90, height: 90) // Tamanho do avatar
                                    .clipShape(Circle()) // Torna a imagem circular
                                    .overlay(
                                        Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                    )
                                    
                            }
                        }
                    }
                    .padding(.leading, 20)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary.opacity(0.2), lineWidth: 1)
                )
                
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
