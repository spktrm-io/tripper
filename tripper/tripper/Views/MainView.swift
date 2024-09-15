import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0 // Índice do item selecionado
    
    var body: some View {
        ZStack {
            // Mostrar a View correta com base no índice selecionado
            if selectedIndex == 0 {
                HomeView()
            } else if selectedIndex == 1 {
                CreateNewRouteView()
            } else if selectedIndex == 2 {
                SavedRoutesView()
            } else if selectedIndex == 3 {
                ProfileView()
            }

            // Barra de guias personalizada
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        selectedIndex = 0
                    }) {
                        HStack {
                            Image(systemName: "house.fill")
                            if selectedIndex == 0 { // Exibe o texto apenas se selecionado
                                Text("Home")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 0 ? Color.black : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 0 ? .white : .black) // Muda a cor do ícone e do texto
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                    Button(action: {
                        selectedIndex = 1
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            if selectedIndex == 1 { // Exibe o texto apenas se selecionado
                                Text("Add trip")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 1 ? Color.black : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 1 ? .white : .black) // Muda a cor do ícone e do texto
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                    Button(action: {
                        selectedIndex = 2
                    }) {
                        HStack {
                            Image(systemName: "bookmark.fill")
                            if selectedIndex == 2 { // Exibe o texto apenas se selecionado
                                Text("Saved")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 2 ? Color.black : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 2 ? .white : .black) // Muda a cor do ícone e do texto
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                    Button(action: {
                        selectedIndex = 3
                    }) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                            if selectedIndex == 3 { // Exibe o texto apenas se selecionado
                                Text("Profile")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 3 ? Color.black : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 3 ? .white : .black) // Muda a cor do ícone e do texto
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                }
                .padding()
                .padding(.bottom, 30)
                .background(.ultraThinMaterial) // Fundo da barra de guias
            }
        }
        .edgesIgnoringSafeArea(.bottom) // Ignora a área segura para cobrir toda a parte inferior da tela
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
