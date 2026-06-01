//
//  ProfileMenuRow.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//
import SwiftUI

struct ProfileMenuRow: View {
    let icon: String
    let title: String
    var isLast: Bool = false
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Button(action: onTap) {
                HStack(spacing: 16) {
                    ZStack {
                        AppRoundedCorner(radius: 10, corners: .allCorners)
                            .fill(Color.green.opacity(0.15))
                            .frame(width: 44, height: 44)

                        Image(systemName: icon)
                            .foregroundColor(.green)
                            .font(.system(size: 18))
                    }

                    Text(title)
                        .font(.body)
                        .foregroundColor(.primary)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14, weight: .medium))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
            }
            .buttonStyle(.plain)

            if !isLast {
                Divider()
                    .padding(.leading, 76)
            }
        }
    }
}
