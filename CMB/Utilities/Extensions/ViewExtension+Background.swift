//
//  ViewExtension+Background.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 19/5/26.
//

import SwiftUI

extension View {
    func appBackground() -> some View {
        ZStack {
            AppBackground()
            self
        }
    }
}
extension Color {
    static let appGreen = Color(red: 0/255, green: 152/255, blue: 70/255)
}
