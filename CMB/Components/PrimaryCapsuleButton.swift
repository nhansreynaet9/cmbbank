//
//  PrimaryCapsuleButton.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 15/5/26.
//

import SwiftUI

struct PrimaryCapsuleButton: View {

    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 6) {
                
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(title)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                    .tracking(-0.15)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color(hex: "#139D61").opacity(0.1)) // Using your hex directly for consistency
            .foregroundColor(Color(hex: "#139D61"))
            .clipShape(Capsule())
        }
    }
}
