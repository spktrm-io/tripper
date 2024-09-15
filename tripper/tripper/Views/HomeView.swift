import SwiftUI

struct ToggleButtonsView: View {
    @State private var selectedIndex: Int? = 0 // Índice do botão selecionado (inicia como nil)
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) { // Espaçamento entre os botões
                ForEach(0..<5, id: \.self) { index in
                    Button(action: {
                        // Define o botão selecionado. Se for o mesmo, deseleciona.
                        selectedIndex = selectedIndex == index ? nil : index
                    }) {
                        let textColor: Color = colorScheme == .dark ? Color.black : Color.white

                        Text("Button \(index + 1)")
                            .padding(.vertical, 10) // Reduz o padding vertical
                            .padding(.horizontal, 20)
                            .fontWeight(.bold)
                            .background(selectedIndex == index ? Color.primary : Color.clear)
                            .foregroundColor(selectedIndex == index ? textColor : Color.primary)
                            .cornerRadius(10)
                            .overlay(
                               RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedIndex == index ? Color.clear : Color.primary, lineWidth: 1.5)
                            )
                    }
                }
            }
            .padding()
        }
    }
}

struct CardView: View {
    var title: String
    var description: String
    let cardWidth = UIScreen.main.bounds.width * 0.85
    let cardHeight = UIScreen.main.bounds.height * 0.50
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
        
            Image("andes")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardWidth, height: cardHeight) // Define o tamanho da imagem
                .clipped()
            
            // Conteúdo do card (textos) sobre a imagem
            HStack{
                VStack(alignment: .leading, spacing: 10) { // Alinha o conteúdo à esquerda
                    Text(title)
                        .font(.system(size: 36, weight: .black)) // Aumenta o tamanho do título
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial) // Aplica o fundo translúcido ao VStack
            .cornerRadius(10)
            .padding([.leading, .trailing, .bottom], 10) // Espaçamento para não ficar colado nas bordas do card
        }
        .frame(width: cardWidth, height: cardHeight) // Define a largura e altura do card
        .cornerRadius(15) // Bordas arredondadas
        .padding(.trailing, 20) // Espaçamento entre os cards
    }
}

struct HomeView: View {
    @State private var searchText: String = "" // Estado para armazenar o texto de pesquisa

    var body: some View {
        VStack{
            Image("tripper-logo-dark") // Substitua pelo nome da imagem no Assets
               .resizable()
               .aspectRatio(contentMode: .fit) // Ajusta a imagem
               .frame(height: 60) // Define a altura da imagem
            
            HStack {
                TextField("Where you want to pass?", text: $searchText)
                    .padding(10)
                    .background(Color(.clear)) // Fundo da barra de pesquisa
                    .cornerRadius(10)
                    .overlay(
                       RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1.5)
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
        }.padding(.top, 10)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
