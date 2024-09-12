import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    private var manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    // Função para verificar o status da autorização do usuário
    func checkLocationAuthorization() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Acesso à localização negado ou restrito.")
        case .authorizedAlways, .authorizedWhenInUse:
            lastKnownLocation = manager.location?.coordinate
            manager.startUpdatingLocation()  // Reiniciar atualizações, caso necessário
        @unknown default:
            print("Estado de autorização desconhecido.")
        }
    }

    // Função delegada chamada quando a localização é atualizada
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            lastKnownLocation = location.coordinate
        }
    }

    // Função delegada chamada quando há um erro na localização
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Falha ao obter localização: \(error.localizedDescription)")
    }

    // Função para parar atualizações de localização
    func stopLocationUpdates() {
        manager.stopUpdatingLocation()
    }

    // Função para reiniciar as atualizações de localização
    func startLocationUpdates() {
        manager.startUpdatingLocation()
    }
}
