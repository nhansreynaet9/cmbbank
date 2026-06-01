import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locationError: String?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 10
        manager.requestWhenInUseAuthorization()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            locationError = "Location permission denied. Please enable in Settings."
            print("DEBUG: Location permission denied")
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
 
        guard location.horizontalAccuracy < 100 else { return }
        
        print("DEBUG: Location updated: \(location.coordinate.latitude), \(location.coordinate.longitude)")

        Task { @MainActor in
            self.userLocation = location.coordinate
            self.locationError = nil
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print("DEBUG: Location error: \(error.localizedDescription)")
        Task { @MainActor in
            self.locationError = error.localizedDescription
        }
    }
    

    func stopUpdating() {
        manager.stopUpdatingLocation()
    }
    

    func startUpdating() {
        manager.startUpdatingLocation()
    }
}
