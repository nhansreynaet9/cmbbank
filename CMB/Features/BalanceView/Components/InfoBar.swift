import SwiftUI

struct AccountInfoBar: View {
    var onTap: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text("Account info")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(16)
        .background(Color(hex: "#0B5E3E"))
        .clipShape(AppRoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        .contentShape(Rectangle())
        .onTapGesture { onTap?() }
    }
}
