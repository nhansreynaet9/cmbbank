//
//  PaymentsModel.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import SwiftUI

struct PaymentCategory: Identifiable {
    let id = UUID()
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String
}
