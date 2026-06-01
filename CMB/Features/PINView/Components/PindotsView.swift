//
//  PindotsView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//

import SwiftUI

struct PinDotsView: View {
    let count: Int
    let total: Int
    let isError: Bool

    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<total, id: \.self) { i in
                Circle()
                    .fill(dotColor(for: i))
                    .frame(width: 16, height: 16)
                    .scaleEffect(i < count ? 1.1 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: count)
            }
        }
    }

    private func dotColor(for index: Int) -> Color {
        if isError { return .red.opacity(0.6) }
        return index < count ? Color.brandPrimary : Color.gray.opacity(0.3)
    }
}
