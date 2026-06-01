//
//  ProfileFooter.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//
import SwiftUI

struct ProfileFooter: View {
    let appVersion: String
    let lastLogin: String
    let hasUpdate: Bool
    let onUpdate: () -> Void

    var body: some View {
        VStack(spacing: 6) {
            Text("App Version: \(appVersion)")
                .font(.footnote)
                .foregroundColor(.secondary)

            Text("Last Login: \(lastLogin)")
                .font(.footnote)
                .foregroundColor(.secondary)

            if hasUpdate {
                Text("New Version Available!")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                PrimaryButton(
                    title: "UPDATE NOW",
                    action: onUpdate
                )
                .padding(.top, 8)
            }

            // Chip Mong Bank logo
            Image("ic_chipmonglogo")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(.top, 16)
        }
        .multilineTextAlignment(.center)
        .padding(.vertical, 16)
    }
}
