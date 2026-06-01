//
//  ScreenContent.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 21/5/26.
//

import SwiftUI

struct ScreenContent<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(.horizontal, 16)
    }
}
