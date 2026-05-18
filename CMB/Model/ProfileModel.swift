//
//  ProfileImageView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 15/5/26.
//

import SwiftUI

struct ProfileImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 1))
    }
}
