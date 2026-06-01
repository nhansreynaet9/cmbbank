import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let name: String
    let time: String
    let amount: String
    let isPositive: Bool
    let initials: String
    let isPending: Bool
    let date: String

    init(name: String, time: String, amount: String, isPositive: Bool, initials: String, isPending: Bool, date: String = "") {
        self.name = name
        self.time = time
        self.amount = amount
        self.isPositive = isPositive
        self.initials = initials
        self.isPending = isPending
        self.date = date
    }
}

struct TransactionGroup {
    let date: String
    let transactions: [Transaction]
}

enum TransactionTab: String, CaseIterable {
    case all = "All"
    case moneyIn = "Money In"
    case moneyOut = "Money Out"
}
