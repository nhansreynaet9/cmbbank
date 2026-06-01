//
//  textfield.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//
import SwiftUI
struct CMBTextField: View {
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .font(.system(size: 15))
            .padding(.horizontal, 16)
            .frame(height: 54)
            .background(Color.white)
            .cornerRadius(14)
    }
}
