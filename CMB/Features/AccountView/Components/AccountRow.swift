//
//  AccountRow.swift
//  CMB
//

import SwiftUI

struct AccountRow: View {
    let account: BankAccount
    var isHidden: Bool = false
    var onAccountSettings: ((AccountInfo) -> Void)? = nil
    var onUnhide: (() -> Void)? = nil

    private var accentColor: Color {
        switch account.type {
        case .savings:   return Color.brandPrimary
        case .deposit:   return Color(hex: "#2CACA7")
        case .chumnounh: return Color(hex: "#2CACA7").opacity(0.6)
        }
    }

    var body: some View {
        WhiteCard {
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(accentColor)
                        .frame(width: 5, height: 33)
                        .padding(.trailing, 12)
                        .clipShape(
                            CustomCornerShape(
                                topLeft: 0,
                                topRight: 17,
                                bottomLeft: 0,
                                bottomRight: 22
                            )
                        )

                    VStack(alignment: .leading, spacing: 4) {
                        Text(account.name)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isHidden ? .secondary : .primary)  
                        Text(account.number)
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    if isHidden {
                        Button(action: { onUnhide?() }) {
                            HStack(spacing: 4) {
                                Image(systemName: "eye")
                                    .font(.system(size: 13))
                                Text("Unhide")
                                    .font(.system(size: 13, weight: .medium))
                            }
                            .foregroundColor(.brandPrimary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.brandPrimary.opacity(0.1))
                            .clipShape(Capsule())
                        }
                    } else {
                        Button(action: {
                            onAccountSettings?(
                                AccountInfo(name: account.name, number: account.number)
                            )
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.secondary)
                                .font(.system(size: 15))
                                .padding(8)
                        }
                    }
                }
                .padding(.top, 16)

                Divider()
                    .padding(.leading, 15)
                    .padding(.top, 12)

                HStack {
                    Spacer()
                    Text("\(account.balance) \(account.currency)")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.primary)
                        .blur(radius: isHidden ? 6 : 0)
                }
                .padding(.top, 10)
                .padding(.bottom, 14)
            }
            .padding(.horizontal, 16)
        }
        .opacity(isHidden ? 0.75 : 1.0)
    }
}

#Preview {
    VStack(spacing: 12) {
        AccountRow(account: BankAccount(
            name: "Payday Account",
            number: "3333 4444",
            balance: "0.00",
            currency: "USD",
            type: .savings
        ))
        AccountRow(
            account: BankAccount(
                name: "Hidden Account",
                number: "1111 2222",
                balance: "5,000.00",
                currency: "USD",
                type: .savings
            ),
            isHidden: true,
            onUnhide: {}
        )
    }
    .padding()
}
