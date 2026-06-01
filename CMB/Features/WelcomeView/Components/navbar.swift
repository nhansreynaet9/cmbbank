//
//  navbar.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//
import SwiftUI


struct navbar: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
            Spacer()
            Button(action: {}) {
                Text("Help?")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}
