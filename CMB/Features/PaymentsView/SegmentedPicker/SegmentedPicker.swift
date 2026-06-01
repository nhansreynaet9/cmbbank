//
//  SegmentedPicker.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//
import SwiftUI

struct SegmentedPicker: View {
    @Binding var selected: String
    let options: [String]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selected = option
                    }
                } label: {
                    Text(option)
                        .font(.system(size: 15, weight: selected == option ? .semibold : .regular))
                        .foregroundColor(selected == option ? .brandPrimary : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(selected == option ? Color.white : Color.clear)
                        .clipShape(Capsule())
                }
            }
        }
        .padding(4)
        .background(Color.white.opacity(0.3))
        .clipShape(Capsule())
    }
}
