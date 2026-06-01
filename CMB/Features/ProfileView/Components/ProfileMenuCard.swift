//
//  ProfileMenuCard.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//
import SwiftUI
 
struct ProfileMenuCard: View {
    let icon: String
    let title: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {


                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .clipShape(AppRoundedCorner(radius: 14, corners: .allCorners))

                Text(title)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color(.systemBackground))
            .clipShape(AppRoundedCorner(radius: 16, corners: .allCorners))
        }
        .buttonStyle(.plain)
    }
}
