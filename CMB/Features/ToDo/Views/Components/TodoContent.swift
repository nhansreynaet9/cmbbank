//
//  TodoContent.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//
import SwiftUI

struct TodoContentView: View {

    let viewState: ViewState
    let filteredTodos: [Todo]
    let onRetry: () -> Void

    var body: some View {
        switch viewState {
        case .idle:
            EmptyView()

        case .loading:
            Spacer()
            VStack(spacing: 12) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.2)
                Text("Fetching TODOs...")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()

        case .success:
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredTodos) { todo in
                        TodoRowView(todo: todo)
                    }
                }
                .padding(.bottom, 16)
            }

        case .error(let message):
            Spacer()
            VStack(spacing: 16) {
                ZStack {
                    Circle().fill(Color.red.opacity(0.2)).frame(width: 64, height: 64)
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.red)
                }
                Text(message)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal)
                Button(action: onRetry) {
                    Text("Retry")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(Color.brandPrimary)
                        .cornerRadius(10)
                }
            }
            .padding()
            Spacer()
        }
    }
}
