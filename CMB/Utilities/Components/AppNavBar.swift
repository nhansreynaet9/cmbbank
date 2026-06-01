import SwiftUI

struct AppNavBar: View {
    @EnvironmentObject var navigator: AppNavigator
    let title: String
    var onBack: (() -> Void)? = nil
    var trailingItem: AnyView? = nil

    var body: some View {
        HStack {
            Button {
                if let onBack = onBack {
                    onBack()
                } else {
                    navigator.pop()           
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
            }

            Spacer()

            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            if let trailingItem = trailingItem {
                trailingItem
            } else {
                Color.clear
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 16)
    }
}
