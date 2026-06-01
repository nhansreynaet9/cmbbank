//
//  AccountsViewModel.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 19/5/26.
//

import SwiftUI
import Combine
@MainActor
final class AccountsViewModel: ObservableObject {

    enum AccountTab: String, CaseIterable, Identifiable {
        case all     = "All"
        case savings = "Savings"
        case deposit = "Deposit"

        var id: String { rawValue }
    }

    @Published private(set) var selectedTab: AccountTab = .all
    @Published private(set) var accounts: [BankAccount] = []


    var onBack: (() -> Void)?
    var onOpenAccount: (() -> Void)?

    var filteredAccounts: [BankAccount] {
        switch selectedTab {
        case .all:     return accounts
        case .savings: return accounts.filter { $0.type == .savings }
        case .deposit: return accounts.filter { $0.type == .deposit }
        }
    }

    var totalAccountCount: Int {
        accounts.count
    }
    init() {
        loadAccounts()
    }
    func didSelectTab(_ tab: AccountTab) {
        withAnimation(.spring(response: 0.3)) {
            selectedTab = tab
        }
    }

    func didTapOpenAccount() {
        onOpenAccount?()
    }
    private func loadAccounts() {
        accounts = [
            BankAccount(name: "Payday Account",    number: "3333 4444", balance: "0.00", currency: "USD", type: .savings),
            BankAccount(name: "Premier Account",   number: "2412 5467", balance: "120",  currency: "USD", type: .savings),
            BankAccount(name: "Chumnounh Account", number: "1111 2222", balance: "0.00", currency: "KHR", type: .chumnounh),
        ]
    }
}
