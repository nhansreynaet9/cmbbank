//
//  AppSheet.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//

import SwiftUI

struct AppSheet<Content: View>: View {
    var topPadding: CGFloat = 12
    var horizontalPadding: CGFloat = 0
    var showShadow: Bool = true
    @ViewBuilder let content: () -> Content

    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                AppRoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                    .fill(Color(hex: "#F5F5F5"))
                    .shadow(
                        color: showShadow ? .black.opacity(0.08) : .clear,
                        radius: 12, x: 0, y: -4
                    )
            )
            .padding(.top, topPadding)
            .ignoresSafeArea(edges: .bottom)
    }
}
