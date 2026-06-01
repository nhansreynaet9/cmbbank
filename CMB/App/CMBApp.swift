import SwiftUI
import GoogleMaps

@main
struct CMBApp: App {
    @StateObject private var navigator = AppNavigator()
    @StateObject private var tabCoordinator = TabCoordinator()

    init() {
        GMSServices.provideAPIKey("AIzaSyALqOFBkZUKNlWtGQL5rDHFy8zybsDyuqg") 
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(navigator)
                .environmentObject(tabCoordinator)
        }
    }
}
