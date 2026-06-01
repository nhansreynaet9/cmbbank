//
//  onChange.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 18/5/26.
//
import SwiftUI

extension View {
    @ViewBuilder
    func onChangeCompat<T: Equatable>(of value: T, perform: @escaping (T) -> Void) -> some View {
        if #available(iOS 17.0, *) {
            self.onChange(of: value) { _, newValue in perform(newValue) }
        } else {
            self.onChange(of: value) { newValue in perform(newValue) }
        }
    }
}
