import SwiftUI

struct AccountCardView: View {
    @EnvironmentObject var navigator: AppNavigator

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {

                HStack(spacing: 8) {
                    Image("ic_pg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    Text("Sreynaet's Account ...3123")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color(hex: "9E9E9E"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)

                    Text("Default")
                        .font(.system(size: 11, weight: .medium))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(hex: "00A859").opacity(0.12))
                        .foregroundColor(Color(hex: "00A859"))
                        .clipShape(Capsule())
                        .fixedSize()

                    Spacer()
                }

                Spacer()

                HStack(spacing: 8) {
                    Text("$1168.00")
                        .font(.system(size: geometry.size.width < 300 ? 20 : 26, weight: .bold))
                        .foregroundColor(Color(hex: "1A1A1A"))
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)

                    Image("ic_eye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Color(hex: "00A859"))
                }

                Spacer()

                HStack {
                    Spacer()

                    PrimaryCapsuleButton(
                        title: "Pay & Transfer",
                        icon: "ic_transfer"
                    ) {

                    }
                }
            }
            .padding(16)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "F5F5F5"), lineWidth: 1)
            )
            .onTapGesture {
                navigator.openPremierAccountHistory()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 135)
    }
}
