//
//  BranchLocation.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 26/5/26.
//

import Foundation


    enum BranchTab: String, CaseIterable {
        case branch  = "Branches"
        case atm     = "ATMs"
        case agent   = "Agents"
        case exchange = "Exchange"
    }


struct BranchLocation: Identifiable {
    let id = UUID()
    var name: String
    var lat: Double
    var lng: Double
    var type: BranchTab
}
