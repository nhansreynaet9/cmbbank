import SwiftUI
import Combine

final class AppNavigator: ObservableObject {

    @Published var activeRoute: AppRoute? = nil
    @Published var showNotifications = false
    @Published var showProfile       = false
    @Published var showBenefits      = false


    func openQRScanner()             { activeRoute = .qrScanner }
    func openAccounts()              { activeRoute = .accounts }
    func openPayments()              { activeRoute = .payments }
    func openProfile()               { activeRoute = .profile }
    func openPremierAccountHistory() { activeRoute = .premierAccountHistory }
    func openLocator()               { activeRoute = .locator }
    func openNotifications()         { showNotifications = true }
    func openBenefits()              { showBenefits = true }

    func pop()        { activeRoute = nil }
    func dismissAll() {
        activeRoute       = nil
        showNotifications = false
        showProfile       = false
        showBenefits      = false
    }
}
