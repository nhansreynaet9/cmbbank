import SwiftUI
import GoogleMaps
import CoreLocation

struct GoogleMapScreen: View {

    @State private var selectedTab: BranchTab = .branch
    @State private var centerOnUser = false
    @StateObject private var locationManager = LocationManager()

    let locations: [BranchLocation] = [
        BranchLocation(name: "Head Office", lat: 11.5564, lng: 104.9282, type: .branch),
        BranchLocation(name: "ATM Toul Kork", lat: 11.5800, lng: 104.9100, type: .atm),
        BranchLocation(name: "Branch BKK", lat: 11.5500, lng: 104.9300, type: .branch),
        BranchLocation(name: "Branch Sen Sok", lat: 11.6000, lng: 104.8800, type: .branch),
        BranchLocation(name: "ATM Central Market", lat: 11.5650, lng: 104.9200, type: .atm)
    ]

    var body: some View {
        VStack(spacing: 0) {
            tabSelector

            ZStack(alignment: .bottomTrailing) {
                GoogleMapView(
                    markers: locations.filter { $0.type == selectedTab },
                    centerOnUser: $centerOnUser,
                    userLocation: locationManager.userLocation
                )
                .ignoresSafeArea(edges: .bottom)

                myLocationButton
            }
        }
        .navigationTitle("Map")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var tabSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(BranchTab.allCases, id: \.self) { tab in
                    Button(action: { selectedTab = tab }) {
                        Text(tab.rawValue)
                            .font(.system(size: 13, weight: .medium))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(selectedTab == tab ? Color.green.opacity(0.15) : Color.clear)
                            .foregroundColor(selectedTab == tab ? .green : .gray)
                            .overlay(Capsule().stroke(selectedTab == tab ? Color.green : Color.gray.opacity(0.3)))
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(16)
        }
    }

    private var myLocationButton: some View {
        Button(action: { centerOnUser = true }) {
            Image(systemName: "location.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(12)
                .background(Color.green)
                .clipShape(Circle())
                .shadow(radius: 6)
        }
        .padding(20)
    }
}
