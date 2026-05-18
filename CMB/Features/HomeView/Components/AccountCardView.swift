import SwiftUI

struct AccountCardView: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 0) { // Using 0 spacing to explicitly control gaps

            // 1. Top Header Row
            HStack {
                Image(systemName: "building.columns.fill")
                    .foregroundColor(Color(hex: "007D43"))

                Text("INSTANT ACCOUNT ...8274")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.gray)

                Spacer()

                Text("Default")
                    .font(.system(size: 11, weight: .medium))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.1))
                    .foregroundColor(.green)
                    .clipShape(Capsule())
            }
            
            // Explicit 12px Gap
            Spacer(minLength: 12)

            // 2. Balance Row
            HStack(spacing: 8) {
                Text("$ 10")
                    .font(.title.bold())

                Image(systemName: "eye.fill")
                    .foregroundColor(.green.opacity(0.7))
            }
            
            // Explicit 12px Gap
            Spacer(minLength: 12)

            // 3. Action Button Row
            HStack {
                Spacer()

                PrimaryCapsuleButton(
                    title: "Pay & Transfer",
                    icon: "arrow.up.right.and.arrow.down.left.rectangle"
                ) {
                    // Action
                }
            }
        }
        .padding(16) // Exact Figma 16px padding
        .frame(maxWidth: 356, minHeight: 135) // Exact Figma Dimensions
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20)) // Exact Figma 20px Radius
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1) // Exact Figma 1px border
        )
    }
}
