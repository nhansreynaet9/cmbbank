//
//  PinKeypadView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//


import SwiftUI

struct PinKeypadView: View {
    let onTap: (Int) -> Void
    let onDelete: () -> Void

    private let rows: [[Int?]] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [nil, 0, -1] // nil = empty, -1 = delete
    ]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                Divider()
                HStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { colIndex in
                        keyCell(rows[rowIndex][colIndex])
                        if colIndex < 2 {
                            Divider()
                                .frame(width: 1)
                                .frame(maxHeight: .infinity)
                        }
                    }
                }
                .frame(height: 80)
            }
        }
    }

    @ViewBuilder
    private func keyCell(_ value: Int?) -> some View {
        Button(action: {
            if let v = value {
                if v == -1 { onDelete() }
                else { onTap(v) }
            }
        }) {
            ZStack {
                if let v = value {
                    if v == -1 {
                        Image(systemName: "delete.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.primary)
                    } else {
                        Text("\(v)")
                            .font(.system(size: 28, weight: .regular))
                            .foregroundColor(.primary)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(.plain)
        .disabled(value == nil)
    }
}