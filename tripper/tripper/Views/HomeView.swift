import SwiftUI

struct HomeView: View {
    @State private var searchText: String = "" // Estado para armazenar o texto de pesquisa
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    @EnvironmentObject var locationService: LocationService // Use EnvironmentObject

    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        
        ScrollView(showsIndicators: false) { // Remove a barra de rolagem lateral
            VStack{
                HStack{
                    Image(logoName) // Substitua pelo nome da imagem no Assets
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Ajusta a imagem
                        .frame(height: 60) // Define a altura da imagem
                    Spacer()
                    Button(action: {}) {
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
                    TextField("Where you want to pass?", text: $searchText)
                        .padding(10)
                        .background(Color(.clear)) // Fundo da barra de pesquisa
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                .padding(.top)
                
                ToggleButtonsView()
                ScrollView(.horizontal, showsIndicators: false) { // Lista horizontal
                    HStack(alignment: .top, spacing: 0) { // Remove o espaçamento padrão
                        ForEach(0..<5) { index in
                            CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                        }
                    }
                    .padding(.leading, 20)
                }
                Spacer()
            }
            .padding(.top, 16)
        }
        .onAppear {
            if locationService.currentCity == nil {
                locationService.startLocationUpdates()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationService(completer: .init()))
    }
}
