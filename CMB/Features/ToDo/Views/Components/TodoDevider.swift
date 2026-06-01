//
//  TodoDevider.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

struct TodoDividerView: View {
    var body: some View {
        Rectangle()
            .fill(Color.white.opacity(0.15))
            .frame(height: 1)
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
    }
}
