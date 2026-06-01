import SwiftUI

struct ProfileInformationView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigator: AppNavigator
    @StateObject private var viewModel = ProfileInfoViewModel()
    @State private var isAdditionalExpanded: Bool = true

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                AppBackground()

                VStack(spacing: 0) {

               
                    AppNavBar(
                        title: "Information",
                        onBack: { presentationMode.wrappedValue.dismiss() },
                        trailingItem: AnyView(
                            Button(action: {}) {
                                Image(systemName: "ellipsis")
                                    .font(.sfProMedium(18))
                                    .foregroundColor(.white)
                            }
                        )
                    )

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {

                            ProfileHeaderCard(
                                fullName: viewModel.profile?.fullName ?? "—",
                                userID: viewModel.profile?.userID ?? "—"
                            )

                            AppSheet(topPadding: 0) {
                                if viewModel.isLoading {
                                    ProgressView()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                } else if viewModel.profile != nil {

                                    VStack(spacing: 0) {

                                        ProfileInfoSectionHeader(title: "Personal Informations")

                                        ProfileInfoCard {
                                            ForEach(Array(viewModel.personalInfoRows.enumerated()), id: \.offset) { index, row in
                                                ProfileInfoRow(
                                                    icon: row.icon,
                                                    label: row.label,
                                                    value: row.value,
                                                    showDivider: index < viewModel.personalInfoRows.count - 1
                                                )
                                            }
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.top, 12)

                                        ProfileInfoSectionHeader(
                                            title: "Additional & Employment Information",
                                            isCollapsible: true,
                                            onToggle: { isAdditionalExpanded = $0 }
                                        )

                                        if isAdditionalExpanded {
                                            ProfileInfoSectionHeader(
                                                title: "Residential Address",
                                                isSubSection: true
                                            )

                                            ProfileInfoCard {
                                                ForEach(Array(viewModel.residentialAddressRows.enumerated()), id: \.offset) { index, row in
                                                    ProfileInfoRow(
                                                        icon: row.icon,
                                                        label: row.label,
                                                        value: row.value,
                                                        showDivider: index < viewModel.residentialAddressRows.count - 1
                                                    )
                                                }
                                            }
                                            .padding(.horizontal, 16)
                                            .padding(.top, 12)
                                            .transition(.opacity.combined(with: .move(edge: .top)))
                                        }

                                        // MARK: - Sign Out
                                        PrimaryButton(
                                            title: "Sign Out",
                                            icon: "ic_signout"
                                        ) {
                                            // handle sign out
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.top, 24)
                                    }
                                    .padding(.bottom, max(geometry.safeAreaInsets.bottom + 16, 32))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .bottom)
                }
                .ignoresSafeArea(edges: .bottom)
                .navigationBarHidden(true)
            }
            .onAppear {
                Task { await viewModel.fetchProfile() }
            }
        }
    }
}

#Preview {
    NavigationView {
        ProfileInformationView()
            .environmentObject(AppNavigator())
    }
    .navigationViewStyle(.stack)
}
