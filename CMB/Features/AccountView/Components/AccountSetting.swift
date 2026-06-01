//
//  AccountSettingsSheet.swift
//  CMB
//

import SwiftUI

struct NativeAccountSettingsSheet: View {
    let account: AccountInfo
    @State var notificationsEnabled: Bool
    var onDismiss: (() -> Void)?
    var onRename: (() -> Void)?
    var onHide: (() -> Void)?
    var onShare: (() -> Void)?
    var onParentControl: (() -> Void)?

    var body: some View {
        VStack(spacing: 0) {
        
            Capsule()
                .fill(Color(.systemGray4))
                .frame(width: 36, height: 4)
                .padding(.top, 10)
                .padding(.bottom, 20)

    
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Account settings")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                    Text("\(account.name) | \(account.number)")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

            VStack(spacing: 0) {
                SettingsRow(icon: "ic_rename", title: "Rename") {
                    onDismiss?(); onRename?()
                }
                Divider().padding(.leading, 60)

                SettingsRow(icon: "ic_hide", title: "Hide Account") {
                    onHide?()
                }
                Divider().padding(.leading, 60)

                SettingsRow(icon: "ic_shareaccount", title: "Share Account Details") {
                    onDismiss?(); onShare?()
                }
                Divider().padding(.leading, 60)

                SettingsRow(icon: "ic_parent", title: "Parent Control") {
                    onDismiss?(); onParentControl?()
                }
                Divider().padding(.leading, 60)

                HStack(spacing: 16) {
                    Image("ic_notification")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .frame(width: 28, alignment: .center)
                    Text("Notification")
                        .font(.system(size: 16))
                        .foregroundColor(.primary)
                    Spacer()
                    Toggle("", isOn: $notificationsEnabled)
                        .labelsHidden()
                        .accentColor(Color.primary)
                }
                .padding(.vertical, 18)
                .padding(.horizontal, 20)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(.horizontal, 16)


            Spacer().frame(height: 0)
                .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity)
        .background(
            AppRoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                .fill(Color(.systemGroupedBackground))
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .frame(width: 28, alignment: .center)
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 20)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}
