import Foundation

final class TodoService: Sendable {

    static let shared = TodoService()
    private init() {}

    func fetchTodos() async throws -> [Todo] {
        try await APIManager.shared.request(
            [Todo].self,
            endpoint: .todos
        )
    }

    func fetchTodoById(_ id: Int) async throws -> Todo {
        try await APIManager.shared.request(
            Todo.self,
            endpoint: .todoById(id)
        )
    }
}
