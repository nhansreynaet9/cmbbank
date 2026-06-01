import SwiftUI

struct TodoRowView: View {
    let todo: Todo

    var body: some View {
        WhiteCard {
            HStack(spacing: 12) {

                ZStack {
                    Circle()
                        .fill(todo.completed
                              ? Color.brandPrimary.opacity(0.15)
                              : Color.labelGray.opacity(0.1))
                        .frame(width: 36, height: 36)

                    Image(systemName: todo.completed
                          ? "checkmark.circle.fill"
                          : "circle")
                        .foregroundColor(todo.completed
                                         ? .brandPrimary
                                         : .labelGray)
                        .font(.system(size: 18))
                }

         
                VStack(alignment: .leading, spacing: 4) {
                    Text(todo.title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .strikethrough(todo.completed, color: .labelGray)
                        .foregroundColor(todo.completed
                                         ? .labelGray
                                         : .hideAccountLabel)
                        .lineLimit(2)

                    Text("User #\(todo.userId)")
                        .font(.caption)
                        .foregroundColor(.labelGray)
                }

                Spacer()

                // ID badge
                Text("#\(todo.id)")
                    .font(.caption2)
                    .foregroundColor(.labelGray)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.labelGray.opacity(0.1))
                    .cornerRadius(4)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}
