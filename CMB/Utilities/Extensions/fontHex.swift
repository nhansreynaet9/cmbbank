//
//  fontHex.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 27/5/26.
//

import SwiftUI

extension Font {

    static func sfProRegular(_ size: CGFloat) -> Font {
        .system(size: size, weight: .regular, design: .default)
    }

    static func sfProMedium(_ size: CGFloat) -> Font {
        .system(size: size, weight: .medium, design: .default)
    }

    static func sfProSemibold(_ size: CGFloat) -> Font {
        .system(size: size, weight: .semibold, design: .default)
    }


    static func sfProBold(_ size: CGFloat) -> Font {
        .system(size: size, weight: .bold, design: .default)
    }

    static let sfPro15Regular = sfProRegular(15)
    static let sfPro18Regular = sfProRegular(18)
    static let sfPro15Semibold = sfProSemibold(15)
    static let sfPro18Semibold = sfProSemibold(18)
    static let sfPro13Regular = sfProRegular(13)
    static let sfPro14Regular = sfProRegular(14)
    static let sfPro14Semibold = sfProSemibold(14)
    static let sfPro30Bold = sfProBold(30)
}
