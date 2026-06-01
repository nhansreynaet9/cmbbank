//
//  TodoHeader.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

 struct TodoStatsHeaderView: View {

    let pendingCount: Int
    let completedCount: Int

    var body: some View {
        HStack {
            StatBadgeView(icon: "circle", iconColor: .white, iconBg: Color.white.opacity(0.15), count: pendingCount, label: "Pending")
            Spacer()
            StatBadgeView(icon: "checkmark.circle.fill", iconColor: .donutGreen, iconBg: Color.donutGreen.opacity(0.3), count: completedCount, label: "Completed")
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 12)
    }
}
