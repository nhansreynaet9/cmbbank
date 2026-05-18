import SwiftUI

struct AccountCardView: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            HStack(spacing: 8) {
                Image("ic_pg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text("Sreynaet's Account ...3123")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color(hex: "9E9E9E"))

                Text("Default")
                    .font(.system(size: 11, weight: .medium))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color(hex: "00A859").opacity(0.12))
                    .foregroundColor(Color(hex: "00A859"))
                    .clipShape(Capsule())

                Spacer()
            }
            Spacer()

   
            HStack(spacing: 8) {
                Text("$1168.00")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(Color(hex: "1A1A1A"))

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
        .frame(width: 356, height: 135)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "F5F5F5"), lineWidth: 1)
        )
    }
}
