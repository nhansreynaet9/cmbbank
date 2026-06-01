//
//  AccountSheet.swift
//  CMB
//

import SwiftUI

struct AccountSheet: View {
    @Binding var selectedTab: AccountsViewModel.AccountTab
    let onSelectTab: (AccountsViewModel.AccountTab) -> Void
    let accounts: [BankAccount]
    @Binding var hiddenAccountIDs: Set<String>
    var onAccountSettings: ((AccountInfo) -> Void)? = nil

    private let tabs: [AccountsViewModel.AccountTab] = AccountsViewModel.AccountTab.allCases
    private var pageIndex: Binding<Int> {
        Binding(
            get: { tabs.firstIndex(of: selectedTab) ?? 0 },
            set: { onSelectTab(tabs[$0]) }
        )
    }

    var body: some View {
        AppSheet {
            VStack(spacing: 0) {

                AccountTabSelector(
                    selected: $selectedTab,
                    onSelect: onSelectTab
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)

                TabView(selection: pageIndex) {
                    ForEach(tabs.indices, id: \.self) { index in
                        AccountListView(
                            accounts: visibleAccounts(for: tabs[index]),
                            hiddenAccounts: hiddenAccounts(for: tabs[index]),
                            hiddenAccountIDs: $hiddenAccountIDs,
                            onAccountSettings: onAccountSettings
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }

    private func visibleAccounts(for tab: AccountsViewModel.AccountTab) -> [BankAccount] {
        accountsForTab(tab).filter { !hiddenAccountIDs.contains($0.number) }
    }

    private func hiddenAccounts(for tab: AccountsViewModel.AccountTab) -> [BankAccount] {
        accountsForTab(tab).filter { hiddenAccountIDs.contains($0.number) }
    }

    private func accountsForTab(_ tab: AccountsViewModel.AccountTab) -> [BankAccount] {
        switch tab {
        case .all:     return accounts
        case .savings: return accounts.filter { $0.type == .deposit }
        case .deposit: return accounts.filter { $0.type == .deposit }
        }
    }
}
