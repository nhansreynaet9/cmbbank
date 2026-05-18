//
//  FigmaGlassContainer.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 16/5/26.
//

import SwiftUI

// MARK: - Reusable Modifiers
struct FigmaGlassContainer: ViewModifier {
    var width: CGFloat?
    var height: CGFloat?

    func body(content: Content) -> some View {
        content
            // Custom specified layout frame properties
            .frame(maxWidth: width, minHeight: height)
            .background(
                // Base fill color #303030 with 67% alpha opacity
                Color(red: 48/255, green: 48/255, blue: 48/255)
                    .opacity(0.67)
                    // Structural background blur context corresponding to Figma Blur Radius 4
                    .background(GlobalVisualBlurEffect(style: .systemThinMaterialDark).blur(radius: 4))
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                // 1.5px Outer Border with Color #606060 at 30% alpha opacity
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 96/255, green: 96/255, blue: 96/255).opacity(0.30), lineWidth: 1.5)
            )
            .overlay(
                // 2px Inner Alignment Shadow Emulation overlay block
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 96/255, green: 96/255, blue: 96/255).opacity(0.30), lineWidth: 2)
                    .blur(radius: 4)
                    .offset(x: 0, y: 1)
                    .mask(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2))
            )
    }
}

// MARK: - Global Trailing Syntax Extension
extension View {
    func figmaGlassStyle(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        self.modifier(FigmaGlassContainer(width: width, height: height))
    }
}

// MARK: - UIKit Blur Bridge for Precise Rendering
struct GlobalVisualBlurEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
