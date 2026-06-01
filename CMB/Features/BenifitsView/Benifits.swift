//
//  Benifits.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
import SwiftUI

struct BenefitsView: View {
    var body: some View {
        ZStack {
            AppBackground()
            VStack(spacing: 16) {
                Image(systemName: "gift.fill")
                    .font(.system(size: 52))
                    .foregroundColor(.brandPrimary)

                Text("Benefits")
                    .font(.system(size: 24, weight: .bold, design: .rounded))

                Text("Your benefits will appear here.")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview { BenefitsView() }
