import Foundation

enum Constants {
    enum API {
        static let baseURL = "https://jsonplaceholder.typicode.com/"
    }
}

enum Endpoints {
    case todos
    case todoById(Int)

    var rawValue: String {
        switch self {
        case .todos:             return "todos"
        case .todoById(let id):  return "todos/\(id)"
        }
    }
}
