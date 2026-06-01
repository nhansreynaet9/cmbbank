import SwiftUI
import GoogleMaps
import CoreLocation

struct GoogleMapView: UIViewRepresentable {

    var markers: [BranchLocation]
    @Binding var centerOnUser: Bool
    var userLocation: CLLocationCoordinate2D?

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var hasInitiallyMovedToUser = false
        var parent: GoogleMapView?

        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            print("DEBUG: Tapped marker - \(marker.title ?? "Unknown")")
            return false
        }

      
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            print("DEBUG: Tapped map at \(coordinate.latitude), \(coordinate.longitude)")
        }
    }

    func makeUIView(context: Context) -> GMSMapView {

        let mapView = GMSMapView()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = false
        mapView.delegate = context.coordinator
        context.coordinator.parent = self

   
        let camera = GMSCameraPosition.camera(
            withLatitude: 11.5564,
            longitude: 104.9282,
            zoom: 15
        )
        mapView.camera = camera

 
        mapView.mapType = .normal
        mapView.settings.compassButton = true
        mapView.settings.zoomGestures = true
        mapView.settings.scrollGestures = true
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {

    
        uiView.clear()

        for location in markers {

            let marker = GMSMarker()

            marker.position = CLLocationCoordinate2D(
                latitude: location.lat,
                longitude: location.lng
            )

            marker.title = location.name
            if let markerImage = UIImage(named: "ic_chipmong")
            {
                let size = CGSize(width: 36, height: 36)
                let renderer = UIGraphicsImageRenderer(size: size)
                let resized = renderer.image { _ in
                    markerImage.draw(in: CGRect(origin: .zero, size: size))
                }
                marker.icon = resized
            } else {
                marker.icon = GMSMarker.markerImage(with: .systemBlue)
            }

            marker.appearAnimation = .pop
            marker.map = uiView
        }

      
        if let location = userLocation {

        
            if !context.coordinator.hasInitiallyMovedToUser {
                context.coordinator.hasInitiallyMovedToUser = true
                let camera = GMSCameraPosition.camera(
                    withTarget: location,
                    zoom: 16
                )
                uiView.animate(to: camera)
            }


            if centerOnUser {
                let camera = GMSCameraPosition.camera(
                    withTarget: location,
                    zoom: 16
                )
                uiView.animate(to: camera)

                Task { @MainActor in
                    centerOnUser = false
                }
            }
        }
    }
}
