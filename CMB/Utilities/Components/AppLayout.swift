//
//  AppLayout.swift
//  CMB
//

import SwiftUI

struct AppLayout<Content: View>: View {
    var scrollOffset: CGFloat = 0
    var showHeader: Bool = true
    var showTab: Bool = true
    let content: Content

    @EnvironmentObject var tabCoordinator: TabCoordinator
    @EnvironmentObject var navigator: AppNavigator

    init(
        scrollOffset: CGFloat = 0,
        showHeader: Bool = true,
        showTab: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.scrollOffset = scrollOffset
        self.showHeader = showHeader
        self.showTab = showTab
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            AppBackground()

            content

            if showHeader {
                VStack(spacing: 0) {
                    HeaderView(scrollOffset: scrollOffset, navigator: navigator)
                    Spacer()
                }
                .ignoresSafeArea(edges: .top)
            }

        
        }
    }
}
