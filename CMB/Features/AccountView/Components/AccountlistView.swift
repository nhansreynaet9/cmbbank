//
//  AccountListView.swift
//  CMB
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct AccountListView: View {
    let accounts: [BankAccount]
    let hiddenAccounts: [BankAccount]
    @Binding var hiddenAccountIDs: Set<String>
    var onAccountSettings: ((AccountInfo) -> Void)? = nil

    @State private var showHidden: Bool = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {

                ForEach(accounts) { account in
                    AccountRow(
                        account: account,
                        onAccountSettings: onAccountSettings
                    )
                }

                if !hiddenAccounts.isEmpty {
                    VStack(spacing: 8) {

                        Button {
                            withAnimation(Animation.easeInOut(duration: 0.3)) {
                                showHidden.toggle()
                            }
                        } label: {
                            HStack(spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(Color.hideIconBackground)
                                        .frame(width: 48, height: 48)
                                    Image(systemName: "lock.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.hideIconForeground)
                                }

                                Text("Hide Account")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color.hideAccountLabel)  //

                                Spacer()

                                Image(systemName: showHidden ? "chevron.up" : "chevron.down")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color.hideChevron)  // ←
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(
                                ZStack {
                                    BlurView(style: .systemUltraThinMaterial)
                                    LinearGradient(
                                        colors: [
                                            Color.hideGradientStart,
                                            Color.hideGradientEnd
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )                                    .opacity(0.85)
                                }
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                        .buttonStyle(PlainButtonStyle())

                        if showHidden {
                            ForEach(hiddenAccounts) { account in
                                AccountRow(
                                    account: account,
                                    isHidden: true,
                                    onAccountSettings: onAccountSettings,
                                    onUnhide: {
                                        withAnimation(Animation.easeInOut(duration: 0.3)) {
                                            _ = hiddenAccountIDs.remove(account.number)
                                        }
                                    }
                                )
                                .transition(.opacity.combined(with: .move(edge: .top)))
                            }
                        }
                    }
                }

            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .padding(.bottom, 100)
        }
    }
}
