import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationService = LocationService(completer: MKLocalSearchCompleter())
    @State private var position = MapCameraPosition.automatic
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: SearchResult?
    @State private var isSheetPresented: Bool = true
    @State private var scene: MKLookAroundScene?
    @State private var route: MKRoute?
    @State private var fetchTask: Task<Void, Never>?


    var body: some View {
        ZStack {
            Map(position: $position, selection: $selectedLocation) {
                ForEach(searchResults) { result in
                    Marker(coordinate: result.location) {
                        Image(systemName: "mappin")
                    }
                    .tag(result)
                }

                // Marcador da localização atual do usuário
                if let userLocation = locationService.currentLocation {
                    Marker(coordinate: userLocation) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                    }
                }

                // Exibição da rota
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(Color.blue, lineWidth: 5)
                }
            }
            .overlay(alignment: .bottom) {
                if selectedLocation != nil {
                    LookAroundPreview(scene: $scene, allowsNavigation: false, badgePosition: .bottomTrailing)
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .safeAreaPadding(.bottom, 40)
                        .padding(.horizontal, 20)
                }
            }
            .ignoresSafeArea()
            .onChange(of: selectedLocation) { _, _ in
                fetchTask?.cancel()
                fetchTask = Task {
                    await updateForSelectedLocation()
                }
                isSheetPresented = selectedLocation == nil
            }
            .onChange(of: searchResults) {
                if let firstResult = searchResults.first, searchResults.count == 1 {
                    selectedLocation = firstResult
                }
            }

            FloatingButtons(leftAction: {
                print("Botão esquerdo pressionado")
            }, rightAction: {
                print("Botão direito pressionado")
            })
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetView(searchResults: $searchResults)
        }
    }
    
    private func updateForSelectedLocation() async {
        guard let selectedLocation else { return }
        do {
            async let sceneResult = fetchScene(for: selectedLocation.location)
            calculateRoute()
            scene = try await sceneResult
        } catch {
            print("Erro ao atualizar para a localização selecionada: \(error)")
        }
    }

    private func fetchScene(for coordinate: CLLocationCoordinate2D) async throws -> MKLookAroundScene? {
        let lookAroundScene = MKLookAroundSceneRequest(coordinate: coordinate)
        return try await lookAroundScene.scene
    }

    private func calculateRoute() {
        // Verifica se temos a localização do usuário e um destino selecionado
        guard let userLocation = locationService.currentLocation,
              let destinationCoordinate = selectedLocation?.location else { return }

        let sourcePlacemark = MKPlacemark(coordinate: userLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile

        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
