//
//  CMBLanguage.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//
import SwiftUI

enum CMBLanguage: String, CaseIterable {
    case khmer   = "ភាសាខ្មែរ"
    case english = "English"
 
    var flagEmoji: String {
        switch self {
        case .khmer:   return "🇰🇭"
        case .english: return "🇺🇸"
        }
    }
}
