import SwiftUI
import MapKit

struct MapMarkerItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Estado para controlar a exibição do Bottom Sheet
    @State private var showBottomSheet = false

    let markers = [
        MapMarkerItem(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                // Mapa de fundo
                Map(coordinateRegion: $region, annotationItems: markers) { marker in
                    MapAnnotation(coordinate: marker.coordinate) {
                        Image(systemName: "pin.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Botões flutuantes no topo
                VStack {
                    HStack {
                        // Botão do lado esquerdo
                        Button(action: {
                            // Ação do botão esquerdo
                            print("Left button tapped")
                        }) {
                            Image(systemName: "car.rear.road.lane")
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray).padding(4)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        Spacer()
                        // Botão do lado direito
                        Button(action: {
                            // Ação do botão direito
                            print("Right button tapped")
                        }) {
                            Image(systemName: "ellipsis")
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray).padding(4)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20) // Coloca os botões mais abaixo da borda superior
                    Spacer()
                }
                
                // Botão para exibir o Bottom Sheet
                VStack {
                    Spacer()
                    Button(action: {
                        showBottomSheet.toggle() // Mostrar ou esconder o Bottom Sheet
                    }) {
                        Text("Show Bottom Sheet")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $showBottomSheet) {
                // O conteúdo do Bottom Sheet
                VStack {
                    Text("This is a Bottom Sheet")
                        .font(.title)
                        .padding()

                    Button(action: {
                        showBottomSheet = false // Fechar o Bottom Sheet
                    }) {
                        Text("Close")
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                .presentationDetents([.medium, .large]) // Definir tamanhos para o Bottom Sheet
                .presentationDragIndicator(.visible) // Mostrar indicador de arrasto
            }
        }
    }
}

#Preview {
    ContentView()
}
