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
                    Button(action: {}){
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "car.fill")
                                    .foregroundStyle(primaryColor)
                                Text("100.000 KM")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
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
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                    }

                    Button(action: {}){
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "road.lanes")
                                    .foregroundStyle(primaryColor)
                                Text("100 routes")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
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
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                    }

                    Button(action: {}){
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "medal.fill")
                                    .foregroundStyle(primaryColor)
                                Text("Gold")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
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
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                    }
                    
                    Button(action: {}){
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "text.book.closed.fill")
                                    .foregroundStyle(primaryColor)
                                Text("10 saveds")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
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
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                    }
                }
                    
                HStack{
                    Text("Medals")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.primary)
                        
                    Spacer()
                    
                    Button(action: {}){
                        Text("see all")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                    HStack(alignment: .center, spacing: 20) { // Remove o espaçamento padrão
                        Button(action: {}){
                            Image("medal-ship")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-airplane")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-starship")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-beach")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-mars")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-montain")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                        Button(action: {}){
                            Image("medal-moon")
                                .resizable()
                                .scaledToFill() // Preenche o espaço mantendo a proporção
                                .frame(width: 90, height: 90) // Tamanho do avatar
                                .clipShape(Circle()) // Torna a imagem circular
                                .overlay(
                                    Circle().stroke(Color.primary.opacity(0.1), lineWidth: 4) // Adiciona uma borda branca
                                )
                        }
                    }
                    .padding([.leading, .trailing], 20)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                )
                
                
                Spacer()
            case 1:
                
                Text("Personal")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "person")
                            .foregroundStyle(primaryColor)
                        Text("Account information")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "house.fill")
                            .foregroundStyle(primaryColor)
                        Text("Address information")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                    
                
                Text("General")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "circle.grid.3x3.fill")
                            .foregroundStyle(primaryColor)
                        Text("Apparence")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(primaryColor)
                        Text("Notifications")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                
                
                Text("Support")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundStyle(primaryColor)
                        Text("Report a error")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                
                Button(action: {}){
                    HStack(alignment: .center) {
                        Image(systemName: "questionmark.circle")
                            .foregroundStyle(primaryColor)
                        Text("FAQ")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(primaryColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                
                Divider()
                    .padding(.vertical)
                
                Button(action: {
                    print()
                }) {
                    HStack {
                        
                        Text("Logout")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // O botão ocupa todo o espaço disponível
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
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
