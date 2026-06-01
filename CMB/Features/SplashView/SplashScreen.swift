//
//  SplashView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 19/5/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var navigator: AppNavigator
    @State private var logoScale: CGFloat = 0.6
    @State private var logoOpacity: Double = 0
    @State private var showLanguageModal: Bool = false

    var body: some View {
        ZStack {
            AppBackground()

            VStack(spacing: 16) {
                Image("logo_chipmong")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 207)

                Image("wordmark_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
            }
            .scaleEffect(logoScale)
            .opacity(logoOpacity)

            if showLanguageModal {
                LanguageModalOverlay(isPresented: $showLanguageModal)
                    .environmentObject(navigator)
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .animation(Animation.easeInOut(duration: 0.35), value: showLanguageModal)
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.65).delay(0.2)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                showLanguageModal = true
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(AppRoundedCorner(radius: radius, corners: corners))
    }
}

#Preview {
    SplashView()
        .environmentObject(AppNavigator())
}
