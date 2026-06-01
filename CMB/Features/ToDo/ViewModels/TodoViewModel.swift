import Foundation
import Combine

@MainActor
class TodoViewModel: ObservableObject {

    @Published var todos: [Todo] = []
    @Published var viewState: ViewState = .idle
    @Published var searchText: String = ""
    @Published var showCompletedOnly: Bool = false

    init() {
        Task { await loadTodos() }
    }

    var filteredTodos: [Todo] {
        todos.filter { todo in
            let matchesSearch = searchText.isEmpty ||
                todo.title.localizedCaseInsensitiveContains(searchText)
            let matchesFilter = !showCompletedOnly || todo.completed
            return matchesSearch && matchesFilter
        }
    }

    var completedCount: Int { todos.filter { $0.completed }.count }
    var pendingCount: Int   { todos.filter { !$0.completed }.count }

    func loadTodos() async {
        viewState = .loading
        do {
            todos = try await TodoService.shared.fetchTodos()
            viewState = .success
        } catch {
            viewState = .error("Failed to load: \(error.localizedDescription)")
        }
    }

    func refresh() async {
        await loadTodos()
    }
}
