//
//  WhiteCard.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 20/5/26.
//

import SwiftUI

struct WhiteCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
    }
}
