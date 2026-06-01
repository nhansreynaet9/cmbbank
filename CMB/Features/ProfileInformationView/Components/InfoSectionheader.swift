//
//  InfoSectionHeader.swift
//  CMB
//

import SwiftUI

struct ProfileInfoSectionHeader: View {
    let title: String
    var isCollapsible: Bool = false
    var isSubSection: Bool = false
    var onToggle: ((Bool) -> Void)? = nil

    @State private var isExpanded: Bool = true

    var body: some View {
        Button(action: {
            guard isCollapsible else { return }
            withAnimation(.easeInOut(duration: 0.25)) {
                isExpanded.toggle()
            }
            onToggle?(isExpanded)
        }) {
            HStack {
                Text(title)
                    .font(isSubSection ? .sfProMedium(14) : .sfProMedium(16))
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                    .padding(.top, 8)
                Spacer()

                if isCollapsible {
                    Image(systemName: "chevron.up")
                        .font(.sfProRegular(12))
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(isExpanded ? 0 : 180))
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .buttonStyle(.plain)
        .disabled(!isCollapsible)
    }
}
