//
//  ModalOverlay.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//

import SwiftUI
struct LanguageModalOverlay: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var navigator: AppNavigator

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                LanguageSelectionView(isPresented: $isPresented)
                    .environmentObject(navigator)
                    .frame(height: geo.size.height * 0.88)
                    .frame(maxWidth: .infinity)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}
 
