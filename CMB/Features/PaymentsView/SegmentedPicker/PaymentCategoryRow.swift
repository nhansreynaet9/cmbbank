//
//  PaymentCategoryRow.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import SwiftUI

struct PaymentCategoryRow: View {
    let category: PaymentCategory

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(category.iconColor)
                    .frame(width: 52, height: 52)
                Image(systemName: category.icon)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(category.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.primary)
                Text(category.subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.5))
                .font(.system(size: 13, weight: .semibold))
        }
        .padding(14)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
