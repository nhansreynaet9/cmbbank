//
//  Tab.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import Foundation

enum Tab: Int, CaseIterable {
    case account   = 0
    case benefits  = 1
    case qr        = 2  // center button — not shown as tab item
    case withdraw  = 3
    case support   = 4

    var title: String {
        switch self {
        case .account:  return "Account"
        case .benefits: return "Benefits"
        case .qr:       return "Scan"
        case .withdraw: return "Withdraw"
        case .support:  return "Support"
        }
    }

    var icon: String {
        switch self {
        case .account:  return "ic_chipmong"
        case .benefits: return "ic_benifits"
        case .qr:       return "ic_scanqr"
        case .withdraw: return "ic_withdrawal"
        case .support:  return "ic_supports"
        }
    }
}
