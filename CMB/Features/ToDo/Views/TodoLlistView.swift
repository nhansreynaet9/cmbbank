import SwiftUI

struct TodoListView: View {

    @StateObject private var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                AppBackground()

                VStack(spacing: 0) {
                    TodoStatsHeaderView(
                        pendingCount: viewModel.pendingCount,
                        completedCount: viewModel.completedCount
                    )
                    TodoSearchBarView(searchText: $viewModel.searchText)
                    TodoFilterToggleView(isOn: $viewModel.showCompletedOnly)
                    TodoDividerView()
                    TodoContentView(
                        viewState: viewModel.viewState,
                        filteredTodos: viewModel.filteredTodos,
                        onRetry: { Task { await viewModel.loadTodos() } }
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("TODO List")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { Task { await viewModel.refresh() } }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                    }
                }
            }
          
        }
    }
}

#Preview {
    TodoListView()
}
