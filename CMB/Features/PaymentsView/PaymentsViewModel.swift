//
//  PaymentsViewModel.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//

import SwiftUI
import Combine

final class PaymentsViewModel: ObservableObject {
    @Published var selectedSegment: String = "Payments"
    @Published var searchText: String = ""

    let categories: [PaymentCategory] = [
        .init(icon: "iphone.and.arrow.forward", iconColor: .green,   title: "Mobile Top Up",      subtitle: "Supported operators: Smart, Cellcard, Metfone"),
        .init(icon: "bolt.fill",                iconColor: Color(red: 0.3, green: 0.7, blue: 0.3), title: "Utilities", subtitle: "Pay for electricity, water and waste bills"),
        .init(icon: "building.2.fill",          iconColor: Color(red: 0.75, green: 0.6, blue: 0.2), title: "Public Services", subtitle: "Pay your taxes or public services"),
        .init(icon: "arrow.triangle.2.circlepath", iconColor: .green, title: "Chip Mong Business", subtitle: "Pay your Chip Mong business's invoices"),
        .init(icon: "person.2.fill",            iconColor: Color(red: 0.7, green: 0.2, blue: 0.7), title: "Charity & Donation", subtitle: "Donate to charitable organization"),
    ]

    var filteredCategories: [PaymentCategory] {
        if searchText.isEmpty { return categories }
        return categories.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
}
