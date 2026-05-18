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

            HStack {

                Image(systemName: icon)

                Text(title)
                    .fontWeight(.semibold)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.green.opacity(0.1))
            .foregroundColor(Color(hex: "007D43"))
            .clipShape(Capsule())
        }
    }
}
