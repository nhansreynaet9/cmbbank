//
//  WithdrawView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//

import SwiftUI

struct WithdrawView: View {
    var body: some View {
        ZStack {
            AppBackground()

            VStack(spacing: 16) {
                Image(systemName: "banknote.fill")
                    .font(.system(size: 52))
                    .foregroundColor(.brandPrimary)

                Text("Withdraw")
                    .font(.system(size: 24, weight: .bold, design: .rounded))

                Text("Withdrawal options will appear here.")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview { WithdrawView() }
