import SwiftUI

struct HorizontalActionsView: View {
    let actions: [ActionModel]
    var onTap: ((ActionModel) -> Void)? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(actions, id: \.title) { action in
                    Button(action: { onTap?(action) }) {
                        SmallActionButton(icon: action.icon, title: action.title)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 7)
        }
    }
}
