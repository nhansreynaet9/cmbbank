//
//  SheetHeaderBar.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//

import SwiftUI

struct SheetHeaderBar: View {
    let title: String
    var showChevron: Bool = true
    var onTap: (() -> Void)? = nil

    var body: some View {
        Button(action: { onTap?() }) {
            HStack {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                if showChevron {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding(16)
            .background(Color(hex: "#0B5E3E"))
            .clipShape(AppRoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        }
        .buttonStyle(.plain)
    }
}
