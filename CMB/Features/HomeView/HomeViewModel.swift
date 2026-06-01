//
//  HomeViewModel.swift
//  CMB
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var scrollOffset: CGFloat = 0



    let services: [ServiceModel] = [
        .init(icon: "ic_wallet",   title: "Accounts"),
        .init(icon: "ic_payment",  title: "Payments"),
        .init(icon: "ic_tranfer",  title: "Transfers"),
        .init(icon: "ic_loans",    title: "Loan"),
        .init(icon: "ic_account",  title: "Cards"),
        .init(icon: "ic_favorite", title: "Favorites")
    ]

    let actions: [ActionModel] = [
        .init(icon: "ic_schedule", title: "Schedules"),
        .init(icon: "ic_exchange", title: "Exchange rate"),
        .init(icon: "ic_locator",  title: "Locator")
    ]

    let frequentItems: [FrequentItem] = [
        .init(image: "img_elect"),
        .init(image: "ic_d"),
        .init(image: "ic_logo1"),
        .init(image: "ic_tm")
    ]
}
