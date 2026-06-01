//
//  TodoFilter.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

struct TodoFilterToggleView: View {

    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Text("Completed Only").font(.subheadline).foregroundColor(.white)
            Spacer()
            Button(action: { isOn.toggle() }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(isOn ? Color.donutGreen : Color.white.opacity(0.2))
                        .frame(width: 48, height: 28)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 22, height: 22)
                        .offset(x: isOn ? 10 : -10)
                        .animation(.spring(response: 0.3), value: isOn)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }
}
