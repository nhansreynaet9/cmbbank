//
//  ProfileInfoCard.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//


import SwiftUI

struct ProfileInfoCard<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 0) {
            content()
        }
        .background(Color.white)
        .clipShape(AppRoundedCorner(radius: 12, corners: .allCorners))
    }
}
