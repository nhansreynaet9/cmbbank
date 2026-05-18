import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        AppLayout(
            selectedTab: $viewModel.selectedTab,
            scrollOffset: viewModel.scrollOffset
        ) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    let offset = geo.frame(in: .global).minY
                    Color.clear
                        .onAppear { viewModel.scrollOffset = -offset }
                        .onChangeCompat(of: offset) { value in
                            viewModel.scrollOffset = -value
                        }
                }
                .frame(height: 0)
                VStack(spacing: 0) {
                    Color.clear.frame(height: 100)
                    QuickBankingChip().padding(.horizontal, 16)
                    AccountCardView().padding(.top, 20).padding(.horizontal, 16)
                    VStack(alignment: .leading, spacing: 8) {
                        BankingServicesView(services: viewModel.services)
                        HorizontalActionsView(actions: viewModel.actions)
                    }
                    .padding(.top, 12).padding(.bottom, 12).padding(.horizontal, 12)
                    .figmaGlassStyle(width: 356, height: 309)
                    .padding(.top, 12).padding(.horizontal, 16)

                    VStack(alignment: .leading, spacing: 6) {
                        FrequentlyUsedSection()
                    }
                    .padding(.top, 12).padding(.bottom, 12).padding(.horizontal, 16)
                    .figmaGlassStyle(width: 356, height: 180)
                    .padding(.top, 12).padding(.horizontal, 16)
                }
                .padding(.bottom, 120)
            }
        }
    }
}
#Preview {
    HomeView()
}
