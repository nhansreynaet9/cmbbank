//
//  AppLayout.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 18/5/26.
//



import SwiftUI

struct AppLayout<Content: View>: View {
    @Binding var selectedTab: Int
    var scrollOffset: CGFloat = 0
    var showHeader: Bool = true
    var showTab: Bool = true
    let content: Content

    init(
        selectedTab: Binding<Int>,
        scrollOffset: CGFloat = 0,
        showHeader: Bool = true,
        showTab: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self._selectedTab = selectedTab
        self.scrollOffset = scrollOffset
        self.showHeader = showHeader
        self.showTab = showTab
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
         
            Color.appBackground
                .ignoresSafeArea()

            Image("bg_tower")
                .resizable()
                .frame(width: 266.3, height: 711.57)
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(x: 132, y: 43)
                .ignoresSafeArea()
                .allowsHitTesting(false)

         
            content
               
      
            if showHeader {
                VStack(spacing: 0) {
                    HeaderView(scrollOffset: scrollOffset)
                    Spacer()
                }
                .ignoresSafeArea(edges: .top)
            }

     
            if showTab {
                CustomTab(selectedTab: $selectedTab)
                    .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}
