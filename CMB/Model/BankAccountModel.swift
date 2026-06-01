import Foundation
struct BankAccount: Identifiable {
    let id: String = UUID().uuidString
    var name: String        // <-- Change from 'let' to 'var'
    let number: String
    let balance: String
    let currency: String
    let type: AccountType

    enum AccountType {
        case savings, deposit, chumnounh
    }
}
