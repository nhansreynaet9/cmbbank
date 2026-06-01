//
//  SigninView.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 1/6/26.
//
import SwiftUI

struct SigninView: View {
    @State private var accountNumber: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            AppBackground()

            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.appGreen.opacity(0.12))
                            .frame(width: 56, height: 56)
                        Image("ic_fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.top, 28)

                    Text("Sign in to Your Account")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(.label))
                        .padding(.top, 16)

                    Text("Enter Your Account Number And Phone Number To Sign In To Your Chip Mong Bank App.")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.secondaryLabel))
                        .padding(.top, 6)

                    CMBTextField(placeholder: "Account number", text: $accountNumber)
                        .padding(.top, 24)

                    CMBTextField(placeholder: "Phone number", text: $phoneNumber, keyboardType: .phonePad)
                        .padding(.top, 12)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(24, corners: [.topLeft, .topRight])

                PrimaryButton(title: "CONTINUE", action: {})
                    .padding(.bottom, 32)
                    .background(Color(.systemGroupedBackground))
            }
            .padding(.top, 30)
            .ignoresSafeArea(edges: .bottom)


            VStack {
                navbar()
                Spacer()
            }
            .zIndex(1)
            .padding(.horizontal, 16)
            
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    SigninView()
}
