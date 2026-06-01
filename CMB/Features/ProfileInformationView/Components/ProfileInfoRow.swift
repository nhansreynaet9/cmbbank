//
//  ProfileInfoRow.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//

import SwiftUI

struct ProfileInfoRow: View {
    let icon: String
    let label: String
    let value: String
    var showDivider: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .frame(width: 24)

                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(.sfProRegular(12))
                        .foregroundColor(.gray)
                    Text(value)
                        .font(.sfProMedium(14))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            if showDivider {
                Divider()
                    .padding(.leading, 52)
            }
        }
    }
}
