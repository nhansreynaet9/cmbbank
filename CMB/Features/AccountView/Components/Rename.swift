//
//  RenameDialog.swift
//  CMB
//

import SwiftUI

struct RenameDialog: View {
    let currentName: String
    var onCancel: (() -> Void)?
    var onSave: ((String) -> Void)?

    @State private var accountName: String = ""
    private let maxLength = 24

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { onCancel?() }

            VStack(spacing: 0) {

                Text("Rename")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 16)

                VStack(alignment: .trailing, spacing: 6) {
                    TextField("Enter account name", text: $accountName)
                        .font(.system(size: 15))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 14)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .onChange(of: accountName) { _ in
                            if accountName.count > maxLength {
                                accountName = String(accountName.prefix(maxLength))
                            }
                        }

                    Text("\(max(1, accountName.count))/\(maxLength)")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)

                Divider()

                HStack(spacing: 12) {
                    Button(action: { onCancel?() }) {
                        Text("Cancel")
                            .font(.system(size: 16))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                    }

                    Button(action: {
                        let trimmed = accountName.trimmingCharacters(in: .whitespaces)
                        guard !trimmed.isEmpty else { return }
                        onSave?(trimmed)
                    }) {
                        Text("SAVE")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.appBackground)
                            .cornerRadius(28)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 24)
            .shadow(color: .black.opacity(0.15), radius: 24, x: 0, y: 8)
        }
        .onAppear {
            accountName = currentName
            
        }
    }
}
