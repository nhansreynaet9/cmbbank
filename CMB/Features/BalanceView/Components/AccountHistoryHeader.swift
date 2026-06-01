//
//  AccountHistoryHeader.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 27/5/26.
//

import SwiftUI

struct AccountHistoryHeader: View {
    var onBack: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            AppNavBar(
                title: "Premier Account History",
             
                trailingItem: AnyView(
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .font(.sfProMedium(18))
                            .foregroundColor(.white)
                    }
                )
            )

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Travel Plans Savings")
                        .foregroundColor(.white)
                        .font(.sfProMedium(18))
                    Text("5521 8832 | Premier Account")
                        .foregroundColor(.white.opacity(0.75))
                        .font(.sfProRegular(13))
                }
                Spacer()
                Image("ic_visa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 14)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(3)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)

            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    Text("Available Balance")
                        .foregroundColor(.white.opacity(0.85))
                        .font(.sfProRegular(13))
                    Image(systemName: "info.circle")
                        .foregroundColor(.white.opacity(0.85))
                        .font(.sfProRegular(12))
                }
                Text("56,750.00 USD")
                    .foregroundColor(.white)
                    .font(.sfProBold(24))
                Text("Total Balance: 78,200.00 USD")
                    .foregroundColor(.white.opacity(0.75))
                    .font(.sfProRegular(13))
            }
            .padding(.bottom, 28)
        }
    }
}
