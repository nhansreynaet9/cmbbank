//
//  AmountSection.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 27/5/26.
//
import SwiftUI

var headerSection: some View {
    VStack(spacing: 0) {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
            }
            Spacer()
            Text("Premier Account History")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .semibold))
            Spacer()
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 20)

        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Travel Plans Savings")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                Text("5521 8832 | Premier Account")
                    .foregroundColor(.white.opacity(0.75))
                    .font(.system(size: 13))
            }
            Spacer()
            Text("VISA")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white, lineWidth: 1.5)
                )
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 16)

        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Text("Available Balance")
                    .foregroundColor(.white.opacity(0.85))
                    .font(.system(size: 13))
                Image(systemName: "info.circle")
                    .foregroundColor(.white.opacity(0.85))
                    .font(.system(size: 12))
            }
            Text("56,750.00 USD")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold))
            Text("Total Balance: 78,200.00 USD")
                .foregroundColor(.white.opacity(0.75))
                .font(.system(size: 13))
        }
        .padding(.bottom, 28)
    }
}
