//
//  MainTabView.swift
//  CMB
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var tabCoordinator: TabCoordinator
    @EnvironmentObject var navigator: AppNavigator

    var body: some View {
        VStack(spacing: 0) {

            ZStack {
                switch tabCoordinator.selectedTab {
                case .account:
                    HomeView()
                        .environmentObject(navigator)
                        .environmentObject(tabCoordinator)

                case .benefits:
                    BenefitsView()

                case .qr:
                    QRScannerView()

                case .withdraw:
                    WithdrawView()

                case .support:
                    SupportView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)


            CustomTab()
                .environmentObject(tabCoordinator)
                .environmentObject(navigator)
             
                .offset(y: -30)
              
                
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea(edges: .bottom)
 
        .sheet(isPresented: $navigator.showNotifications) {
            Text("Notifications")
        }
        .sheet(isPresented: $navigator.showProfile) {
            Text("Profile")
        }
        .sheet(isPresented: $navigator.showBenefits) {
            BenefitsView()
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(TabCoordinator())
        .environmentObject(AppNavigator())
}
