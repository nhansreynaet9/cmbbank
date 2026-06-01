//
//  QRScannerView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//

import SwiftUI

struct QRScannerView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 24) {

                Text("Scan QR Code")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                // Mock scanner frame
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.brandPrimary, lineWidth: 3)
                        .frame(width: 260, height: 260)

                    // Corner accents
                    VStack {
                        HStack {
                            cornerAccent(rotation: 0)
                            Spacer()
                            cornerAccent(rotation: 90)
                        }
                        Spacer()
                        HStack {
                            cornerAccent(rotation: 270)
                            Spacer()
                            cornerAccent(rotation: 180)
                        }
                    }
                    .frame(width: 260, height: 260)

                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 80))
                        .foregroundColor(.white.opacity(0.15))
                }

                Text("Point your camera at a QR code")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding()
        }
    }

    private func cornerAccent(rotation: Double) -> some View {
        RoundedRectangle(cornerRadius: 4, style: .continuous)
            .trim(from: 0, to: 0.15)
            .stroke(Color.brandPrimary, style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .frame(width: 40, height: 40)
            .rotationEffect(.degrees(rotation))
    }
}

#Preview { QRScannerView() }
