//
//  WelcomeBackground.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//

import SwiftUI

struct WelcomeBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: "#33A976"),
                    Color(hex: "#139D61")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Image("bg_welcome")
                .resizable()
                .frame(width: 246.3, height:631.57)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: 150, y: 43)
                .ignoresSafeArea()
                .allowsHitTesting(false)
        }
    }
}
