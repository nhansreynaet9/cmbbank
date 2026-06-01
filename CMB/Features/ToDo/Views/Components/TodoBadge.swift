//
//  TodoBadge.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

 struct StatBadgeView: View {

    let icon: String
    let iconColor: Color
    let iconBg: Color
    let count: Int
    let label: String

    var body: some View {
        HStack(spacing: 6) {
            ZStack {
                Circle().fill(iconBg).frame(width: 28, height: 28)
                Image(systemName: icon).font(.system(size: 12)).foregroundColor(iconColor)
            }
            VStack(alignment: .leading, spacing: 1) {
                Text("\(count)").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                Text(label).font(.caption2).foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
}
