import SwiftUI
import MapKit

struct MapRouteView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var startCoordinate: CLLocationCoordinate2D
    var endCoordinate: CLLocationCoordinate2D

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
        
        // Atualiza a região quando o usuário interage com o mapa
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            parent.region = mapView.region
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = true

        // Adiciona as anotações de início e fim
        let startAnnotation = MKPointAnnotation()
        startAnnotation.coordinate = startCoordinate
        startAnnotation.title = "Start"
        
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endCoordinate
        endAnnotation.title = "End"
        
        mapView.addAnnotations([startAnnotation, endAnnotation])
        mapView.setRegion(region, animated: true)
        
        // Traça a rota entre os pontos
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
        // Atualiza a região somente se houver mudança significativa
        if !regionsAreEqual(uiView.region, region) {
            uiView.setRegion(region, animated: true)
        }
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
                        endCoordinate: CLLocationCoordinate2D(latitude: -22.035075649084703, longitude: -47.899701419181405)
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("Obtendo localização...")
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
                if let newLocation = newLocation {
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
