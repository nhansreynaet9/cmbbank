//
//  ProfileHeaderCard.swift
//  CMB
//

import SwiftUI

struct ProfileHeaderCard: View {
    var fullName: String = "—"
    var userID: String = "—"
    var onBack: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 8) {


            Image("img_profile")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(AppRoundedCorner(radius: 24, corners: .allCorners))
                .overlay(
                    AppRoundedCorner(radius: 24, corners: .allCorners)
                        .stroke(Color.white.opacity(0.4), lineWidth: 4)
                )

            Text(fullName)
                .font(.title2.bold())
                .foregroundColor(.white)

            Text("User ID: \(userID)")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    ProfileHeaderCard(fullName: "Nhan Sreynaet", userID: "01233123124121")
}
