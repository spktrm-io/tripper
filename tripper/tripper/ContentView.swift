import SwiftUI
import MapKit

struct MapRouteView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var startCoordinate: CLLocationCoordinate2D
    var endCoordinate: CLLocationCoordinate2D
    var isMapLocked: Bool

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapRouteView
        
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
            if !parent.isMapLocked {
                parent.region = mapView.region
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = !isMapLocked
        mapView.isScrollEnabled = !isMapLocked
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = !isMapLocked  // Desativa rotação quando o mapa está travado
        
        // Habilita a visualização da localização do usuário com a bolinha azul
        mapView.showsUserLocation = true
        
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endCoordinate
        endAnnotation.title = "End"
        
        mapView.addAnnotation(endAnnotation)
        mapView.setRegion(region, animated: true)
        
        // Traça a rota entre o ponto inicial (localização do usuário) e o destino
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
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Só atualiza a região se o mapa estiver travado na localização do usuário
        if isMapLocked && !regionsAreEqual(uiView.region, region) {
            uiView.setRegion(region, animated: true)
        }
        
        // Desativa rotação, rolagem e zoom quando o mapa está travado
        uiView.isZoomEnabled = !isMapLocked
        uiView.isScrollEnabled = !isMapLocked
        uiView.isRotateEnabled = !isMapLocked
    }

    func regionsAreEqual(_ lhs: MKCoordinateRegion, _ rhs: MKCoordinateRegion) -> Bool {
        lhs.center.latitude == rhs.center.latitude &&
        lhs.center.longitude == rhs.center.longitude &&
        lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
        lhs.span.longitudeDelta == rhs.span.longitudeDelta
    }
}

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var isMapLocked = false  // Estado para travar/destravar o mapa
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
                        isMapLocked: isMapLocked
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("Obtendo localização...")
                }

                // Botão para travar/destravar o mapa na localização do usuário
                VStack {
                    Button(action: {
                        // Ao pressionar, trava o mapa na localização do usuário
                        if let userLocation = locationManager.lastKnownLocation {
                            region = MKCoordinateRegion(
                                center: userLocation,
                                span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)  // Aproxima o zoom
                            )
                            isMapLocked.toggle()  // Trava o mapa
                        }
                    }) {
                        HStack {
                            Image(systemName: isMapLocked ? "lock.fill" : "lock.open.fill")
                            Text(isMapLocked ? "Mapa Travado" : "Travar Mapa")
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
                if let newLocation = newLocation, !isMapLocked {
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
