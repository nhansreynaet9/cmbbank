import SwiftUI

struct RootView: View {
    @EnvironmentObject var navigator: AppNavigator

    var body: some View {
        NavigationView {
            ZStack {
                MainTabView()

                NavigationLink(
                    destination: destinationView(),
                    isActive: Binding(
                        get: { navigator.activeRoute != nil },
                        set: { if !$0 { navigator.activeRoute = nil } }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $navigator.showProfile) {
            ProfileView(onBack: { navigator.showProfile = false })
                .environmentObject(navigator)
        }
    }

    @ViewBuilder
    private func destinationView() -> some View {
        switch navigator.activeRoute {
        case .qrScanner:             QRScannerView()
        case .payments:              TodoListView().environmentObject(navigator)
        case .accounts:              AccountView(onOpenAccount: { navigator.pop() })
        case .profile:               ProfileView(onBack: { navigator.pop() }).environmentObject(navigator)
        case .premierAccountHistory: PremierAccountHistoryView(onBack: { navigator.pop() }).environmentObject(navigator)
        case .locator:               GoogleMapScreen()
        case nil:                    EmptyView()
        }
    }}
