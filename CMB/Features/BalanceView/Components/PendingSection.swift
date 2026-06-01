//
//  PendingSection.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 27/5/26.
//

import SwiftUI

struct PendingSection: View {
    let transactions: [Transaction]
    @State private var isExpanded: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Pending transaction")
                    .font(.sfProMedium(12))
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color(hex: "#FC7854"))
                        .frame(width: 22, height: 22)
                    Text("\(transactions.count)")
                        .font(.sfProBold(12))
                        .foregroundColor(.white)
                }
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.sfProRegular(12))
                    .foregroundColor(Color.hideChevron)
                    .padding(.leading, 4)
            }
            .frame(width: 390, height: 36)
            .padding(.horizontal, 20)
            .background(Color(hex: "#EDC9C0"))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.25)) {
                    isExpanded.toggle()
                }
            }

            if isExpanded {
                ForEach(transactions) { tx in
                    TransactionRow(transaction: tx)
                    Divider().padding(.leading, 72)
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
}
