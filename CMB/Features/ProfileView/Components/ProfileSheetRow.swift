//
//  ProfileSheetRow.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 28/5/26.
//

import SwiftUI


struct ProfileSheetRow: View {
    let title: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14, weight: .medium))
            }
        }
        .buttonStyle(.plain)
    }
}
