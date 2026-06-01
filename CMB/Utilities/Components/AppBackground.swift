//
//  AppBackground.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 19/5/26.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            Image("bg_tower")
                .resizable()
                .frame(width: 266.3, height: 711.57)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: 150, y: 43)
                .ignoresSafeArea()
                .allowsHitTesting(false)
        }
    }
}
