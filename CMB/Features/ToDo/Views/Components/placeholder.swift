//
//  placeholder.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//

import SwiftUI
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: .leading) {
            if shouldShow { placeholder() }
            self
        }
    }
}

