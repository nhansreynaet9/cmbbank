import SwiftUI

struct TotalBalanceCard: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("Total Balance")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)

            GeometryReader { geometry in
                let cardWidth = geometry.size.width
                let cardHeight: CGFloat = 96

                ZStack(alignment: .trailing) {

                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .frame(width: cardWidth, height: cardHeight)

                    VStack(spacing: 12) {
                        balanceRow(symbol: "៛", amount: "0")
                        Divider().padding(.leading, 42)
                        balanceRow(symbol: "$", amount: "120.56")
                    }
                    .padding(12)
                    .frame(width: cardWidth, height: cardHeight, alignment: .leading)

                    AccountsDonutChart(count: 3)
                        .frame(width: 110, height: 90)
                        .offset(x: -10, y: -10)
                }
                .frame(width: cardWidth, height: cardHeight)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 96)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .figmaGlassStyle()
    }

    @ViewBuilder
    private func balanceRow(symbol: String, amount: String) -> some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.green.opacity(0.12))
                    .frame(width: 26, height: 26)
                Text(symbol)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.green)
            }
            Text(amount)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black.opacity(0.8))
            Spacer()
        }
    }
}
