//
//  HomeView.swift
//  CMB
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tabCoordinator: TabCoordinator
    @EnvironmentObject var navigator: AppNavigator
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        AppLayout(scrollOffset: viewModel.scrollOffset, showTab: false) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    let offset = geo.frame(in: .global).minY
                    Color.clear
                        .onAppear { viewModel.scrollOffset = -offset }
                        .onChangeCompat(of: offset) { value in
                            viewModel.scrollOffset = -value
                        }
                    //sfedgrfhtgjhk
                }
                .frame(height: 0)

                VStack(spacing: 0) {
                    Color.clear.frame(height: 100)

                    ScreenContent {
                        QuickBankingChip()
                    }

                    ScreenContent {
                        AccountCardView()
                    }
                    .padding(.top, 20)

                    ScreenContent {
                        VStack(alignment: .leading, spacing: 8) {
                            BankingServicesView(
                                services: viewModel.services,
                                onTap: { service in
                                    
                                    switch service.title {
                                    case "Accounts":  navigator.openAccounts()
                                    case "Payments":  navigator.openPayments()
                                    case "Transfers": print("Transfers tapped")
                                    default:          break
                                    }
                                }
                            )
                            HorizontalActionsView(
                                actions: viewModel.actions,
                                onTap: { action in
                                    switch action.title {
                                    case "Locator": navigator.openLocator()
                                    default: break
                                    }
                                }
                            )
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 12)
                        .figmaGlassStyle()
                    }
                    .padding(.top, 12)

                    ScreenContent {
                        VStack(alignment: .leading, spacing: 6) {
                            FrequentlyUsedSection(items: viewModel.frequentItems)
                        }
                        .padding(.vertical, 12)
                        .figmaGlassStyle()
                    }
                    .padding(.top, 12)
                }
                .padding(.bottom, 120)
            }
        }
  
    }
}

#Preview {
    HomeView()
        .environmentObject(TabCoordinator())
        .environmentObject(AppNavigator())
}
