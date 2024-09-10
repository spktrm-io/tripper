import SwiftUI

// RoadDetailsRoute agora conforma a Hashable
struct RoadDetailsRoute: Identifiable, Hashable {
    var id: String
    var name: String
    var address: String
    var source: String
    var description: String
}

struct RoadItem {
    var id: String
    var name: String
    var address: String
    var source: String
    var description: String
}

struct CardItemRoadList: View {
    let item: RoadItem
    @Binding var navigationPath: NavigationPath // O NavigationPath agora é mutável com @Binding

    var body: some View {
        Button(action: {
            // Ação de navegação
            let route = RoadDetailsRoute(id: item.id, name: item.name, address: item.address, source: item.source, description: item.description)
            navigationPath.append(route) // Adicionando a rota à navegação
        }) {
            VStack(alignment: .leading, spacing: 5) {
                Image(uiImage: UIImage(named: item.source) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .clipped()
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(item.address)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
            }
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                    .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)
            )
            .padding(.horizontal, 10)
        }
    }
}


struct CardItemRoadList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
