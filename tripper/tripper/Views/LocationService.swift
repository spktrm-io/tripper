import MapKit
import SwiftUI

class LocationService: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchCompletions = [MKLocalSearchCompletion]()
    private var searchCompleter: MKLocalSearchCompleter
    
    override init() {
        self.searchCompleter = MKLocalSearchCompleter()
        super.init()
        self.searchCompleter.delegate = self
    }
    
    func updateSearch(query: String) {
        searchCompleter.queryFragment = query
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.searchCompletions = completer.results
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Error completing search: \(error.localizedDescription)")
    }
}
