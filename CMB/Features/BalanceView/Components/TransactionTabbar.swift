import SwiftUI

struct TransactionTabBar: View {
    @Binding var selectedTab: TransactionTab
    var onFilterTap: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TransactionTab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    Text(tab.rawValue)
                        .font(.system(size: 13, weight: selectedTab == tab ? .semibold : .regular))
                        .foregroundColor(selectedTab == tab ? Color.brandPrimary : Color.labelGray)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(
                            selectedTab == tab
                                ? Color.brandPrimary.opacity(0.12)
                                : Color.clear
                        )
                        .clipShape(Capsule())
                }
            }
            Spacer()
            Button(action: { onFilterTap?() }) {
                HStack(spacing: 4) {
                    Image("ic_filter")
                        .font(.system(size: 13))
                    Text("Filter")
                        .font(.system(size: 13))
                }
                .foregroundColor(Color.labelGray)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .overlay(
                    Capsule().stroke(Color.hideChevron.opacity(0.5), lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.white)
        .padding(12)
    }
}
