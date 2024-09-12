import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showEntireRoute = false
    @State private var isFollowingUser = true
    @State private var selectedDetent: PresentationDetent = .fraction(0.3)
    @State private var searchText = ""
    @State private var searchResults = [MKMapItem]()
    @State private var destinationCoordinate: CLLocationCoordinate2D?
    @StateObject private var locationService = LocationService()

    var body: some View {
        NavigationStack {
            ZStack {
                if let userLocation = locationManager.lastKnownLocation {
                    MapRouteView(
                        region: $region,
                        startCoordinate: userLocation,
                        endCoordinate: destinationCoordinate ?? CLLocationCoordinate2D(latitude: -22.035075649084703, longitude: -47.899701419181405),
                        showEntireRoute: showEntireRoute
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("Obtendo localização...")
                }

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
                if let newLocation = newLocation, !showEntireRoute, isFollowingUser {
                    region.center = newLocation
                }
            }
            .sheet(isPresented: .constant(true)) {
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
                    .listStyle(.plain)  // Remove o estilo padrão da lista
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

    func searchForLocation(query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let results = response?.mapItems {
                self.searchResults = results
            }
        }
    }

    func setDestination(to mapItem: MKMapItem) {
        destinationCoordinate = mapItem.placemark.coordinate
        searchResults = []
        showEntireRoute = false
    }
}
