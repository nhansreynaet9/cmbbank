//
//  FavoriteBanner.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import SwiftUI

struct AddFavoriteBanner: View {
    var onCreate: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.brandPrimary)
                        .frame(width: 56, height: 56)
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Add New Favorite")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    Text("Create your favorites now to access them quickly and easily.")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.85))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Button(action: onCreate) {
                Text("Create New Favorite")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.25))
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}
