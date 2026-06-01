import SwiftUI

struct PremierAccountHistoryView: View {
    @StateObject private var viewModel = PremierAccountHistoryViewModel()
    @State private var isPendingExpanded: Bool = true
    var onBack: (() -> Void)? = nil

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                AppBackground()

                VStack(spacing: 0) {
                    AccountHistoryHeader(onBack: onBack)

                    VStack(spacing: 0) {
                        AccountInfoBar()
                            .padding(.horizontal, 16)

                        VStack(spacing: 0) {
                            TransactionTabBar(
                                selectedTab: $viewModel.selectedTab,
                                onFilterTap: {}
                            )

                            if viewModel.isLoading {
                                Spacer()
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                                Spacer()
                            } else if viewModel.transactionsByDate.isEmpty && viewModel.pendingTransactions.isEmpty {
                                VStack(spacing: 12) {
                                    Spacer()
                                    Image(systemName: "tray")
                                        .font(.system(size: 40))
                                        .foregroundColor(Color.labelGray)
                                    Text("No Transactions")
                                        .font(.headline)
                                        .foregroundColor(Color.labelGray)
                                    Text("Your transaction history will appear here.")
                                        .font(.caption)
                                        .foregroundColor(Color.labelGray.opacity(0.7))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 32)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            } else {
                                ScrollView {
                                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {

                                        // Pending Section
                                        if !viewModel.pendingTransactions.isEmpty {
                                            Section(header:
                                                HStack {
                                                    Text("Pending transaction")
                                                        .font(.sfProMedium(12))
                                                        .foregroundColor(.black)
                                                        .padding(.leading, 16)
                                                    Spacer()
                                                    ZStack {
                                                        Circle()
                                                            .fill(Color(hex: "#FC7854"))
                                                            .frame(width: 22, height: 22)
                                                        Text("\(viewModel.pendingTransactions.count)")
                                                            .font(.sfProBold(12))
                                                            .foregroundColor(.white)
                                                    }
                                                    Image(systemName: isPendingExpanded ? "chevron.up" : "chevron.down")
                                                        .font(.sfProRegular(12))
                                                        .foregroundColor(Color.hideChevron)
                                                        .padding(.leading, 4)
                                                        .padding(.trailing, 16)
                                                }
                                                .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                                                .background(Color(hex: "#EDC9C0"))
                                                .contentShape(Rectangle())
                                                .onTapGesture {
                                                    withAnimation(.easeInOut(duration: 0.25)) {
                                                        isPendingExpanded.toggle()
                                                    }
                                                }
                                            ) {
                                                ForEach(viewModel.pendingTransactions) { tx in
                                                    TransactionRow(transaction: tx)
                                                        .frame(height: isPendingExpanded ? nil : 0)
                                                        .clipped()
                                                    Divider()
                                                        .padding(.leading, 72)
                                                        .frame(height: isPendingExpanded ? nil : 0)
                                                        .clipped()
                                                }
                                            }
                                        }

                                        // Regular transactions grouped by date
                                        ForEach(viewModel.transactionsByDate, id: \.date) { group in
                                            Section(header:
                                                Text(group.date)
                                                    .font(.caption)
                                                    .fontWeight(.medium)
                                                    .foregroundColor(Color.labelGray)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.horizontal, 16)
                                                    .padding(.vertical, 8)
                                                    .background(Color.white)
                                                    .accessibilityAddTraits(.isHeader)
                                            ) {
                                                ForEach(group.transactions) { tx in
                                                    TransactionRow(transaction: tx)
                                                }
                                            }
                                        }

                                        Color.clear
                                            .frame(height: max(geometry.safeAreaInsets.bottom + 140, CGFloat(160)))
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: .infinity)
                        .background(Color.white)
                        .clipShape(AppRoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
                    }
                    .frame(maxHeight: .infinity)
                    .background(Color(hex: "#0B5E3E"))
                    .clipShape(AppRoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)

                VStack {
                    Spacer()
                    PrimaryButton(title: "PAY & TRANSFER", action: {})
                        .padding(.horizontal, 16)
                        .padding(.bottom, max(geometry.safeAreaInsets.bottom + 12, CGFloat(32)))
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationBarHidden(true)
        }
        .onAppear {
            Task { await viewModel.fetchTransactions() }
        }
    }
}

#Preview {
    PremierAccountHistoryView(onBack: {})
        .environmentObject(AppNavigator())
}
