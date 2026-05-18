//
//  GlobalHelpers.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 17/5/26.
//

import SwiftUI


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct VisualBlurEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}


extension View {
    func glassBorders() -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 96/255, green: 96/255, blue: 96/255).opacity(0.30), lineWidth: 1.5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 96/255, green: 96/255, blue: 96/255).opacity(0.30), lineWidth: 2)
                .blur(radius: 4)
                .offset(x: 0, y: 1)
                .mask(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2))
        )
    }
}


