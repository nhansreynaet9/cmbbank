import SwiftUI

struct TransactionSection: View {
    var transactions: [Transaction]
    var dateLabel: String

    var body: some View {
        Section(
            header:
                Text(dateLabel)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color.labelGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
        ) {
            ForEach(transactions) { tx in
                TransactionRow(transaction: tx)
            }
        }
    }
}
