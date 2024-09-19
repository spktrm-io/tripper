import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0 // Índice do item selecionado
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme

    var body: some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        let bottomTabMenuHeight: CGFloat = 110
        
        ZStack {
            switch selectedIndex {
            case 0:
                HomeView(bottomSpacer: bottomTabMenuHeight)
            case 1:
                CreateNewRouteView()
                    .padding(.bottom, bottomTabMenuHeight)
            case 2:
                SavedRoutesView()
                    .padding(.bottom, bottomTabMenuHeight)
            case 3:
                ProfileView()
                    .padding(.bottom, bottomTabMenuHeight)
            default:
                HomeView(bottomSpacer: bottomTabMenuHeight)
            }
               
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        selectedIndex = 0
                    }) {
                        HStack {
                            Image(systemName: "map.fill")
                            if selectedIndex == 0 { // Exibe o texto apenas se selecionado
                                Text("Explore")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 0 ? primaryColor : Color.clear)
                        .foregroundColor(selectedIndex == 0 ? secondaryColor : primaryColor)
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                    Button(action: {
                        selectedIndex = 1
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            if selectedIndex == 1 { // Exibe o texto apenas se selecionado
                                Text("Create")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(selectedIndex == 1 ? primaryColor : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 1 ? secondaryColor : primaryColor) // Muda a cor do ícone e do texto
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
                        .background(selectedIndex == 2 ? primaryColor : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 2 ? secondaryColor : primaryColor) // Muda a cor do ícone e do texto
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
                        .background(selectedIndex == 3 ? primaryColor : Color.clear) // Fundo preto quando selecionado
                        .foregroundColor(selectedIndex == 3 ? secondaryColor : primaryColor) // Muda a cor do ícone e do texto
                        .cornerRadius(10) // Borda arredondada
                    }
                    Spacer()
                }
                .padding()
                .padding(.bottom, 30)
                .frame(height: bottomTabMenuHeight)
                .background(.ultraThinMaterial)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LocationService(completer: .init()))
    }
}
