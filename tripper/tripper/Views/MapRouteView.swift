import SwiftUI
import MapKit

// View para exibir o mapa e as rotas
struct MapRouteView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var startCoordinate: CLLocationCoordinate2D
    var endCoordinate: CLLocationCoordinate2D?
    var showEntireRoute: Bool

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapRouteView
        var mapView: MKMapView?

        init(_ parent: MapRouteView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor(Color.blue)
                renderer.lineWidth = 4.0
                return renderer
            }
            return MKOverlayRenderer()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        context.coordinator.mapView = mapView
        mapView.delegate = context.coordinator
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = true
        mapView.showsUserLocation = true

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Verificar se o destino é válido e se há mudanças antes de recalcular a rota
        guard let endCoordinate = endCoordinate else {
            uiView.setRegion(region, animated: true)
            return
        }
        
        // Verificar se já existe uma rota desenhada no mapa
        if uiView.overlays.isEmpty {
            // Recalcular e adicionar a rota apenas se não houver nenhuma rota desenhada
            let request = MKDirections.Request()
            let startPlacemark = MKPlacemark(coordinate: startCoordinate)
            let endPlacemark = MKPlacemark(coordinate: endCoordinate)
            request.source = MKMapItem(placemark: startPlacemark)
            request.destination = MKMapItem(placemark: endPlacemark)
            request.transportType = .automobile

            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }

                // Adicionar nova rota ao mapa
                uiView.addOverlay(route.polyline)

                if self.showEntireRoute {
                    let edgePadding = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
                    uiView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: edgePadding, animated: true)
                } else {
                    uiView.setRegion(self.region, animated: true)
                }
            }
        } else {
            // Se já houver uma rota, apenas ajustar a visualização se necessário
            if showEntireRoute {
                if let overlay = uiView.overlays.first as? MKPolyline {
                    let edgePadding = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
                    uiView.setVisibleMapRect(overlay.boundingMapRect, edgePadding: edgePadding, animated: true)
                }
            } else {
                uiView.setRegion(self.region, animated: true)
            }
        }
    }
}
