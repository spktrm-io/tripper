import SwiftUI
import MapKit

struct MapMarkerItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @Binding var region: MKCoordinateRegion
    let markers: [MapMarkerItem]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: markers) { marker in
            MapAnnotation(coordinate: marker.coordinate) {
                Image(systemName: "pin.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
