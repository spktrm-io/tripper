import SwiftUI
import MapKit

// ContentView - Interface principal
struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0), // Valores padrão temporários
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showEntireRoute = false
    @State private var isFollowingUser = true
    @State private var selectedDetent: PresentationDetent = .fraction(0.3)
    @State private var searchText = ""
    @State private var searchResults = [MKMapItem]()
    @State private var destinationCoordinate: CLLocationCoordinate2D?  // Começa como nil
    @StateObject private var locationService = LocationService()
    @State private var isSearchSheetPresented = true // Controla a exibição do sheet

    var body: some View {
        NavigationStack {
            ZStack {
               

                VStack {
                    Button(action: {
                        if let userLocation = locationManager.lastKnownLocation {
                            if showEntireRoute {
                                region = MKCoordinateRegion(
                                    center: userLocation,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )
                                showEntireRoute = false
                                isFollowingUser = true
                            } else {
                                showEntireRoute = true
                                isFollowingUser = false
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: showEntireRoute ? "location.fill" : "map")
                            Text(showEntireRoute ? "Focar na Localização" : "Exibir Rota Completa")
                        }
                        .padding(10)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    .padding()

                    Spacer()

                    Button(action: {
                        if let userLocation = locationManager.lastKnownLocation {
                            if isFollowingUser {
                                isFollowingUser = false
                            } else {
                                region.center = userLocation
                                isFollowingUser = true
                            }
                        }
                    }) {
                        Image(systemName: isFollowingUser ? "location.fill" : "location")
                            .foregroundColor(.blue)
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    .padding()
                }

                FloatingButtons(leftAction: {
                    print("Left button tapped")
                }, rightAction: {
                    print("Right button tapped")
                })
            }
            .onAppear {
                locationManager.checkLocationAuthorization()
            }
            .onReceive(locationManager.$lastKnownLocation) { newLocation in
                if let newLocation = newLocation {
                    region.center = newLocation
                    if isFollowingUser {
                        region = MKCoordinateRegion(
                            center: newLocation,
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    }
                }
            }
            .sheet(isPresented: $isSearchSheetPresented) {  // Controla o sheet
                VStack {
                    TextField("Pesquisar destino...", text: $searchText, onEditingChanged: { isEditing in
                        if isEditing {
                            selectedDetent = .large
                        }
                    })
                    .onSubmit {
                        locationService.updateSearch(query: searchText)
                    }
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(15)

                    List(locationService.searchCompletions, id: \.self) { completion in
                        Button(action: {
                            searchForLocation(query: completion.title)
                        }) {
                            VStack(alignment: .leading) {
                                Text(completion.title)
                                    .font(.headline)
                                Text(completion.subtitle)
                                    .font(.subheadline)
                            }
                        }
                        .listRowBackground(Color.clear)  // Remove o fundo de cada linha
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)  // Remove o fundo da lista

                    Spacer()
                }
                .padding()
                .presentationDetents([.fraction(0.15), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.15)))
                .presentationBackground(.thinMaterial)
            }
        }
    }

    // Função de busca de localização
    func searchForLocation(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let results = response?.mapItems {
                self.searchResults = results
                if let firstResult = results.first {
                    setDestination(to: firstResult)
                    selectedDetent = .fraction(0.15)
                }
            }
        }
    }

    // Função para definir o destino e calcular a rota no mapa
    func setDestination(to mapItem: MKMapItem) {
        destinationCoordinate = mapItem.placemark.coordinate
        searchResults = []
        showEntireRoute = true // Exibir a rota completa após a seleção
    }
}
