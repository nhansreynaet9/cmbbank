//
//  SupportView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 25/5/26.
//

import SwiftUI

struct SupportView: View {

    private let options: [(icon: String, title: String, subtitle: String, color: Color)] = [
        ("message.fill",        "Live Chat",      "Chat with our support team",     .brandPrimary),
        ("phone.fill",          "Call Us",        "Available 24/7",                 .green),
        ("envelope.fill",       "Email Support",  "We reply within 24 hours",       .orange),
        ("questionmark.circle.fill", "FAQ",       "Browse common questions",        .blue),
    ]

    var body: some View {
        ZStack {
            AppBackground()

            VStack(spacing: 0) {

                // Header
                VStack(spacing: 8) {
                    Image(systemName: "headphones.circle.fill")
                        .font(.system(size: 52))
                        .foregroundColor(.brandPrimary)

                    Text("Support")
                        .font(.system(size: 24, weight: .bold, design: .rounded))

                    Text("How can we help you today?")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 48)
                .padding(.bottom, 32)

                // Options
                VStack(spacing: 12) {
                    ForEach(options, id: \.title) { option in
                        SupportOptionRow(
                            icon: option.icon,
                            title: option.title,
                            subtitle: option.subtitle,
                            color: option.color
                        )
                    }
                }
                .padding(.horizontal, 20)

                Spacer()
            }
        }
    }
}

struct SupportOptionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
        Button {
            print("\(title) tapped")
        } label: {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(color.opacity(0.12))
                        .frame(width: 46, height: 46)

                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(color)
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)

                    Text(subtitle)
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary.opacity(0.5))
            }
            .padding(16)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: .black.opacity(0.04), radius: 8, x: 0, y: 4)
        }
    }
}

#Preview { SupportView() }
