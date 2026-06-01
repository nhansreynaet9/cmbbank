import SwiftUI

struct ProfileView: View {

    let onBack: () -> Void

    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var navigator: AppNavigator
    @State private var showProfileInfo = false

    var body: some View {
        GeometryReader { _ in
            ZStack(alignment: .top) {
                AppBackground()

                VStack(spacing: 0) {
                    AppNavBar(
                        title: "My Profile",
                        trailingItem: AnyView(
                            Button(action: {}) {
                                Image(systemName: "ellipsis")
                                    .font(.sfProMedium(18))
                                    .foregroundColor(.white)
                            }
                        )
                    )
                    ProfileHeaderCard(
                        fullName: viewModel.profile?.fullName ?? "—",
                        userID: viewModel.profile?.userID ?? "—",
                        onBack: onBack
                    )
                    VStack(spacing: 0) {
                        AccountInfoBar(onTap: { showProfileInfo = true })
                            .padding(.horizontal, 16)

                        AppSheet(topPadding: 0) {
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 10) {
                                    ProfileMenuCard(icon: "ic_security", title: "Security",             onTap: {})
                                    ProfileMenuCard(icon: "ic_language", title: "Language",             onTap: {})
                                    ProfileMenuCard(icon: "ic_term",     title: "Terms and Conditions", onTap: {})
                                    ProfileMenuCard(icon: "ic_signout",  title: "Sign out",             onTap: {})

                                    ProfileFooter(
                                        appVersion: viewModel.appVersion,
                                        lastLogin: viewModel.lastLogin,
                                        hasUpdate: viewModel.hasUpdate,
                                        onUpdate: {}
                                    )
                                }
                                .padding(.horizontal, 16)
                                .padding(.top, 16)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .background(Color(hex: "#0B5E3E"))
                    .clipShape(AppRoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)

                NavigationLink(
                    destination: ProfileInformationView()
                        .environmentObject(navigator),
                    isActive: $showProfileInfo
                ) { EmptyView() }
                    .hidden()
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationView {
        ProfileView(onBack: {})
            .environmentObject(AppNavigator())
    }
    .navigationViewStyle(.stack)
}
