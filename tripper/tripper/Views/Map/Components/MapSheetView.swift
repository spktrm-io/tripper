import SwiftUI
import MapKit

struct MapSheetView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
        .presentationDetents([.large])
        .presentationBackground(.ultraThinMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
    }
}

#Preview {
    MapView()
}
