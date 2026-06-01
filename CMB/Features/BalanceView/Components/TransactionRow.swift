import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 14) {
            ZStack(alignment: .bottomTrailing) {
                Circle()
                    .fill(transaction.isPositive ? Color.brandPrimary.opacity(0.15) : Color.hideGradientStart.opacity(0.4))
                    .frame(width: 44, height: 44)

                Text(transaction.initials)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(transaction.isPositive ? Color.brandPrimary : Color.red)
                    .frame(width: 44, height: 44)
                    .multilineTextAlignment(.center)

                Circle()
                    .fill(transaction.isPositive ? Color.brandPrimary : Color.red)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .overlay(
                        Image(transaction.isPositive ? "ic_in" : "ic_out")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white)
                    )
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(transaction.name)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.black)
                Text(transaction.time)
                    .font(.system(size: 12))
                    .foregroundColor(Color.labelGray)
            }

            Spacer()

            Text(transaction.amount)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(transaction.isPositive ? Color.brandPrimary : Color.red)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color.white)
    }
}
