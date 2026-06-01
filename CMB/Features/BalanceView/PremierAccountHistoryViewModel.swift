import SwiftUI
import Combine

@MainActor
class PremierAccountHistoryViewModel: ObservableObject {
    @Published var selectedTab: TransactionTab = .all
    @Published var isLoading: Bool = false
    @Published private var allTransactions: [TransactionGroup] = []
    @Published var pendingTransactions: [Transaction] = []

    var transactionsByDate: [TransactionGroup] {
        switch selectedTab {
        case .all:
            return allTransactions
        case .moneyIn:
            return allTransactions.compactMap { group in
                let filtered = group.transactions.filter { $0.isPositive }
                return filtered.isEmpty ? nil : TransactionGroup(date: group.date, transactions: filtered)
            }
        case .moneyOut:
            return allTransactions.compactMap { group in
                let filtered = group.transactions.filter { !$0.isPositive }
                return filtered.isEmpty ? nil : TransactionGroup(date: group.date, transactions: filtered)
            }
        }
    }

    func fetchTransactions() async {
        isLoading = true

        try? await Task.sleep(nanoseconds: 1_000_000_000)

        let fetched = [
            TransactionGroup(date: "Today, 27 May 2026", transactions: [
                Transaction(name: "John Doe", time: "10:30 AM", amount: "+$500.00", isPositive: true, initials: "JD", isPending: false, date: "Today, 27 May 2026"),
                Transaction(name: "Grocery Store", time: "09:15 AM", amount: "-$45.00", isPositive: false, initials: "GS", isPending: false, date: "Today, 27 May 2026")
            ]),
            TransactionGroup(date: "Yesterday, 26 May 2026", transactions: [
                Transaction(name: "Jane Smith", time: "03:00 PM", amount: "+$200.00", isPositive: true, initials: "JS", isPending: false, date: "Yesterday, 26 May 2026"),
                Transaction(name: "Netflix", time: "12:00 PM", amount: "-$15.99", isPositive: false, initials: "NF", isPending: true, date: "Yesterday, 26 May 2026"),
                Transaction(name: "Salary", time: "08:00 AM", amount: "+$3,000.00", isPositive: true, initials: "SA", isPending: false, date: "Yesterday, 26 May 2026")
            ]),
            TransactionGroup(date: "27 May 2026", transactions: [
                Transaction(name: "Jane Smith", time: "03:00 PM", amount: "+$200.00", isPositive: true, initials: "JS", isPending: false, date: "27 May 2026"),
                Transaction(name: "Netflix", time: "12:00 PM", amount: "-$15.99", isPositive: false, initials: "NF", isPending: true, date: "27 May 2026"),
                Transaction(name: "Salary", time: "08:00 AM", amount: "+$3,000.00", isPositive: true, initials: "SA", isPending: false, date: "27 May 2026")
            ])
        ]

        pendingTransactions = fetched.flatMap { $0.transactions }.filter { $0.isPending }
        allTransactions = fetched.map { group in
            TransactionGroup(
                date: group.date,
                transactions: group.transactions.filter { !$0.isPending }
            )
        }.filter { !$0.transactions.isEmpty }

        isLoading = false
    }
}
