//
//  PinViewMoel.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//

import SwiftUI
import Combine

final class PinViewModel: ObservableObject {

    @Published var digits: [Int] = []
    @Published var isError: Bool = false

    let pinLength = 6

    var isFull: Bool { digits.count == pinLength }

    func tap(_ digit: Int) {
        guard digits.count < pinLength else { return }
        digits.append(digit)
        if isFull { validate() }
    }

    func delete() {
        guard !digits.isEmpty else { return }
        digits.removeLast()
        isError = false
    }

    func forgotPin() {
      
    }

  
    private func validate() {
      
        let correct = [1, 2, 3, 4, 5, 6]
        if digits != correct {
            withAnimation(.easeInOut(duration: 0.3)) {
                isError = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.digits = []
                self.isError = false
            }
        }
    }
}
