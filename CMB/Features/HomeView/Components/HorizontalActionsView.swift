import SwiftUI

struct HorizontalActionsView: View {
    let actions: [ActionModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(actions, id: \.title) { action in
                    SmallActionButton(icon: action.icon, title: action.title)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
        }
    }
}


