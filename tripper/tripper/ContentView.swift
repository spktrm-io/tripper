import SwiftUI
import MapKit

struct MapRouteView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var startCoordinate: CLLocationCoordinate2D
    var endCoordinate: CLLocationCoordinate2D
    var isMapFocusedOnUser: Bool  // Define se o mapa está focado na localização do usuário
    var showEntireRoute: Bool  // Define se o mapa deve mostrar a rota completa

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapRouteView
        var mapView: MKMapView?

        init(_ parent: MapRouteView) {
            self.parent = parent
        }
        
        // Configura a renderização da rota
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor(Color.blue)
                renderer.lineWidth = 4.0
                return renderer
            }
            return MKOverlayRenderer()
        }
        
        // Atualiza a região quando o mapa é interativo e o travamento está desativado
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            if !parent.isMapFocusedOnUser && !parent.showEntireRoute {
                parent.region = mapView.region
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(self)
        return coordinator
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        context.coordinator.mapView = mapView
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = !isMapFocusedOnUser || showEntireRoute
        mapView.isScrollEnabled = !isMapFocusedOnUser || showEntireRoute
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = true
        
        // Habilita a visualização da localização do usuário com a bolinha azul
        mapView.showsUserLocation = true
        
        // Adiciona o destino (End) como anotação
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endCoordinate
        endAnnotation.title = "End"
        mapView.addAnnotation(endAnnotation)
        
        // Define a rota
        let request = MKDirections.Request()
        let startPlacemark = MKPlacemark(coordinate: startCoordinate)
        let endPlacemark = MKPlacemark(coordinate: endCoordinate)
        request.source = MKMapItem(placemark: startPlacemark)
        request.destination = MKMapItem(placemark: endPlacemark)
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addOverlay(route.polyline)
            if self.showEntireRoute {
                // Define o padding maior para garantir que a rota tenha mais espaço ao redor
                let edgePadding = UIEdgeInsets(top: 200, left: 200, bottom: 200, right: 200)
                mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: edgePadding, animated: true)
            } else {
                mapView.setRegion(self.region, animated: true)
            }
        }
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        if showEntireRoute {
            let request = MKDirections.Request()
            let startPlacemark = MKPlacemark(coordinate: startCoordinate)
            let endPlacemark = MKPlacemark(coordinate: endCoordinate)
            request.source = MKMapItem(placemark: startPlacemark)
            request.destination = MKMapItem(placemark: endPlacemark)
            request.transportType = .automobile
            
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }
                let edgePadding = UIEdgeInsets(top: 200, left: 200, bottom: 200, right: 200)  // Padding maior
                uiView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: edgePadding, animated: true)
            }
        } else if isMapFocusedOnUser {
            uiView.setRegion(region, animated: true)
        }

        // Configura interações baseadas no estado
        uiView.isZoomEnabled = !isMapFocusedOnUser || showEntireRoute
        uiView.isScrollEnabled = !isMapFocusedOnUser || showEntireRoute
    }
}

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var isMapFocusedOnUser = true  // Estado para saber se o mapa está focado na localização
    @State private var showEntireRoute = false  // Estado para alternar entre rota completa e localização
    @State private var selectedDetent: PresentationDetent = .fraction(0.3)
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                if let userLocation = locationManager.lastKnownLocation {
                    // Exibe o mapa com a rota usando a localização em tempo real como ponto de partida
                    MapRouteView(
                        region: $region,
                        startCoordinate: userLocation,
                        endCoordinate: CLLocationCoordinate2D(latitude: -22.035075649084703, longitude: -47.899701419181405),
                        isMapFocusedOnUser: isMapFocusedOnUser,
                        showEntireRoute: showEntireRoute
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("Obtendo localização...")
                }

                // Botão para alternar entre localização e rota completa
                VStack {
                    Button(action: {
                        if let userLocation = locationManager.lastKnownLocation {
                            if isMapFocusedOnUser {
                                // Alternar para mostrar a rota completa
                                showEntireRoute = true
                                isMapFocusedOnUser = false
                            } else {
                                // Alternar para focar na localização
                                region = MKCoordinateRegion(
                                    center: userLocation,
                                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)  // Aproxima o zoom
                                )
                                isMapFocusedOnUser = true
                                showEntireRoute = false
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: isMapFocusedOnUser ? "location.fill" : "map")
                            Text(isMapFocusedOnUser ? "Exibir Rota Completa" : "Focar na Localização")
                        }
                        .padding(10)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    .padding()
                    
                    Spacer()
                }

                // Botões flutuantes
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
                if let newLocation = newLocation, isMapFocusedOnUser {
                    region.center = newLocation
                }
            }
            .sheet(isPresented: .constant(true)) {
                VStack {
                    // Barra de pesquisa
                    TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                        if isEditing {
                            selectedDetent = .large
                        }
                    })
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)
                    
                    Spacer()
                }
                .padding()
                .presentationDetents([.fraction(0.15), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .fraction(0.15))
                )
                .presentationBackground(.thinMaterial)
            }
        }
    }
}

#Preview {
    ContentView()
}
