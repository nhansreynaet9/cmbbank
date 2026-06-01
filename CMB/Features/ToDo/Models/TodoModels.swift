//
//  TodoModels.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}
