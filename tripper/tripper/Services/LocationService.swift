import MapKit
import CoreLocation

struct SearchResult: Identifiable, Hashable {
    let id = UUID()
    let location: CLLocationCoordinate2D

    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    var url: URL?
}

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate, MKLocalSearchCompleterDelegate {
    private let completer: MKLocalSearchCompleter
    private let locationManager = CLLocationManager()

    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var completions = [SearchCompletions]()

    init(completer: MKLocalSearchCompleter) {
        self.completer = completer
        super.init()
        print("LocationService: Initialized")
        
        self.completer.delegate = self

        // Configuração do Location Manager
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        print("LocationService: Location Manager configured and started updating location")
    }

    func update(queryFragment: String) {
        print("LocationService.update: Updating query fragment to '\(queryFragment)'")
        completer.resultTypes = .pointOfInterest
        completer.queryFragment = queryFragment
    }

    // MARK: - MKLocalSearchCompleterDelegate

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print("LocationService.completerDidUpdateResults: Received new search completions")
        completions = completer.results.map { completion in
            let mapItem = completion.value(forKey: "_mapItem") as? MKMapItem
            print("LocationService.completerDidUpdateResults: Completion - Title: \(completion.title), Subtitle: \(completion.subtitle)")
            return .init(
                title: completion.title,
                subTitle: completion.subtitle,
                url: mapItem?.url
            )
        }
    }

    // MARK: - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("LocationService.locationManager: Updated location to \(location.coordinate)")
            DispatchQueue.main.async {
                self.currentLocation = location.coordinate
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("LocationService.locationManager: Authorization status changed to \(status)")
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            print("LocationService.locationManager: Started updating location")
        default:
            locationManager.stopUpdatingLocation()
            print("LocationService.locationManager: Stopped updating location")
        }
    }

    // Função de busca permanece a mesma
    func search(with query: String, coordinate: CLLocationCoordinate2D? = nil) async throws -> [SearchResult] {
        print("LocationService.search: Searching for '\(query)' with coordinate: \(String(describing: coordinate))")
        let mapKitRequest = MKLocalSearch.Request()
        mapKitRequest.naturalLanguageQuery = query
        mapKitRequest.resultTypes = .pointOfInterest
        if let coordinate {
            mapKitRequest.region = .init(.init(origin: .init(coordinate), size: .init(width: 1, height: 1)))
        }
        let search = MKLocalSearch(request: mapKitRequest)

        let response = try await search.start()

        print("LocationService.search: Search completed with \(response.mapItems.count) results")
        return response.mapItems.compactMap { mapItem in
            guard let location = mapItem.placemark.location?.coordinate else {
                print("LocationService.search: Failed to get coordinate for a map item")
                return nil
            }
            print("LocationService.search: Found location at \(location)")
            return .init(location: location)
        }
    }
}
