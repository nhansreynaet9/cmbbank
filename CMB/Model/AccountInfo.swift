//
//  AccountInfo.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import Foundation

struct AccountInfo: Identifiable, Equatable {
    let id: UUID = UUID()
    var name: String
    let number: String
}
