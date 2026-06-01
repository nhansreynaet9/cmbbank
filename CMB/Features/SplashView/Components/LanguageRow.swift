//
//  LanguageRow.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//
import SwiftUI

struct LanguageRow: View {
    let language: CMBLanguage
    let isSelected: Bool
    let onTap: () -> Void
 
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                Text(language.flagEmoji)
                    .font(.system(size: 28))
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(language.rawValue)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(.label))
                Spacer()
                ZStack {
                    Circle()
                        .fill(isSelected ? Color(.systemGray3) : Color(.systemGray4))
                        .frame(width: 28, height: 28)
                    Image(systemName: "checkmark")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(isSelected ? Color(.systemGray) : Color(.systemGray2))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(14)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
