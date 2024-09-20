import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomeView: View {
    @State private var searchText: String = "" // Estado para armazenar o texto de pesquisa
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    @EnvironmentObject var locationService: LocationService // Use EnvironmentObject
    @State private var searchResults = [SearchResult]()
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    @State private var selectedIndex: Int = 0 // Índice do item selecionado
    
    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        ScrollView(showsIndicators: false) { // Remove a barra de rolagem lateral
            VStack{
                HStack{
                    Image(logoName) // Substitua pelo nome da imagem no Assets
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Ajusta a imagem
                        .frame(height: 60) // Define a altura da imagem
                    Spacer()
                    Button(action: {
                        isSheetPresented = !isSheetPresented
                    }) {
                        Image(systemName: "mappin")
                        Text(locationService.currentCity ?? "Searching...") // Display the city here
                    }
                    .padding()
                    .foregroundColor(buttonContentColor)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    .overlay(
                       RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
                }
                .padding(.horizontal)
                
                HStack {
                    Button(action: {
                        selectedIndex = 0
                    }) {
                        HStack {
                            Image(systemName: "safari.fill")
                            Text("Discover")
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
                            Image(systemName: "magnifyingglass")
                            Text("Search")
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
                .padding(.horizontal)
                .padding(.top)
                
                switch selectedIndex {
                case 0:
                    Divider()
                        .padding(.top)
                    
                    Text("Recommended")
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(.primary)
                        .padding(.top)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading) // Alinha o texto à esquerda

                    ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                        HStack(alignment: .top, spacing: 0) { // Remove o espaçamento padrão
                            ForEach(0..<5) { index in
                                CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)", isVertical: false)
                            }
                        }
                        .scrollTargetLayout()
                        .padding(.leading, 20)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .padding(.bottom)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Top rated")
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading) // Alinha o texto à esquerda

                    ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                        HStack(alignment: .top, spacing: 0) { // Remove o espaçamento padrão
                            ForEach(0..<5) { index in
                                CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)", isVertical: false)
                            }
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.bottom)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Fastest")
                        .font(.system(size: 30, weight: .black))
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading) // Alinha o texto à esquerda

                    ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                        HStack(alignment: .top, spacing: 0) { // Remove o espaçamento padrão
                            ForEach(0..<5) { index in
                                CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)", isVertical: false)
                            }
                        }
                        .padding(.leading, 20)
                    }
                    .padding(.bottom)
                case 1:
                    Divider()
                        .padding(.top)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Where you want to go?", text: $searchText)
                    }
                    .modifier(TextFieldGrayBackgroundColor())
                    .padding()
                    
                    ToggleButtonsView()
                    
                    VStack(alignment: .leading, spacing: 0) { // Remove o espaçamento padrão
                        ForEach(0..<5) { index in
                            CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                        }
                    }
                    .padding(.vertical)
                default:
                    Spacer()
                }
            
                Spacer()
            }
            .padding(.top, 16)
            Spacer()
                .frame(minHeight: bottomSpacer)
                .fixedSize()
        }
        .onAppear {
            if locationService.currentCity == nil {
                locationService.startLocationUpdates()
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetSearchCityView(searchResults: $searchResults)
        }
        .onTapGesture {
            UIApplication.shared.endEditing() // Fecha o teclado ao tocar fora do TextField
        }
        .gesture(
            DragGesture().onChanged { _ in
                UIApplication.shared.endEditing() // Fecha o teclado ao arrastar fora do TextField
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LocationService(completer: .init()))
    }
}
