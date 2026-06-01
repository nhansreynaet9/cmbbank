import SwiftUI

struct AccountTabSelector: View {
    @Binding var selected: AccountsViewModel.AccountTab
    let onSelect: (AccountsViewModel.AccountTab) -> Void
    private let tabs: [AccountsViewModel.AccountTab] = AccountsViewModel.AccountTab.allCases
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: { onSelect(tab) }) {
                    Text(tab.rawValue)
                        .font(.system(size: 14, weight: selected == tab ? .semibold : .regular))
                        .foregroundColor(
                            selected == tab
                                ? Color.brandPrimary
                                : Color.secondary
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            Group {
                                if selected == tab {
                                    Capsule()
                                        .fill(Color(UIColor.systemBackground))
                                        .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
                                }
                            }
                        )
                }

                if shouldShowDivider(after: tab) {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.3))
                        .frame(width: 1, height: 16)
                }
            }
        }
        .padding(4)
        .background(Color(UIColor.secondarySystemFill))
        .clipShape(Capsule())
        .animation(.easeInOut(duration: 0.2), value: selected)
        .gesture(
            DragGesture(minimumDistance: 20)
                .onEnded { value in
                    if value.translation.width < 0 {
                        selectNext()
                    } else if value.translation.width > 0 {
                        selectPrevious()
                    }
                }
        )
    }
    private func shouldShowDivider(after tab: AccountsViewModel.AccountTab) -> Bool {
        guard let index = tabs.firstIndex(of: tab) else { return false }
        let isLast = index == tabs.count - 1
        if isLast { return false }
        let nextTab = tabs[index + 1]
        return selected != tab && selected != nextTab
    }

    private func selectNext() {
        guard let index = tabs.firstIndex(of: selected),
              index < tabs.count - 1 else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            onSelect(tabs[index + 1])
        }
    }

    private func selectPrevious() {
        guard let index = tabs.firstIndex(of: selected),
              index > 0 else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            onSelect(tabs[index - 1])
        }
    }
}

#Preview {
    AccountTabSelector(
        selected: .constant(.all),
        onSelect: { _ in }
    )
    .padding()
}
