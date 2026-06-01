//
//  Welcome.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            WelcomeBackground()

            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                    }

                    Text("Welcome to")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.9))

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "headphones")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                    }

                    Button(action: {}) {
                        HStack(spacing: 4) {
                            Text("🇺🇸")
                                .font(.system(size: 16))
                            Image(systemName: "chevron.up.chevron.down")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 10)
                        .frame(height: 40)
                        .background(Color.white.opacity(0.15))
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)

                HStack(spacing: 0) {
                   Image("ic_chipmongtext")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 2)

                Spacer()

                Text("Manage your\nmoney and grow\nyour finances")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 440)
            }
            
            VStack(spacing: 12) {

                SecondaryButton(
                    title: "Sign-in",
                    icon: "ic_signin",
                    action: {}
                )

                PrimaryButton(
                    title: "Sign-up for an Instant Account",
                    icon: "ic_signup",
                    action: {}
                )

                Text("Version 3.7.43 - 3704302")
                    .font(.system(size: 12))
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.top, 4)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            .padding(.bottom, 36)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(24, corners: [.topLeft, .topRight])
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
    }
}

#Preview {
    Welcome()
}
