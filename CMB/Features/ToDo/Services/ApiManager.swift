import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL:            return "Invalid URL"
        case .noData:                return "No data received"
        case .decodingError:         return "Failed to parse response"
        case .serverError(let code): return "Server error: \(code)"
        }
    }
}

final class APIManager: Sendable {

    static let shared = APIManager()
    private init() {}

    func request<T: Decodable>(
        _ type: T.Type = T.self,
        endpoint: Endpoints
    ) async throws -> T {

        guard let url = URL(string: "\(Constants.API.baseURL)\(endpoint.rawValue)") else {
            throw NetworkError.invalidURL
        }

        print("📡 [GET] \(url.absoluteString)")

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            print("❌ Network error:", error.localizedDescription)
            throw NetworkError.noData
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            print("❌ Invalid response")
            throw NetworkError.noData
        }

        print("📥 Status:", httpResponse.statusCode)

        guard 200...299 ~= httpResponse.statusCode else {
            print("❌ HTTP error:", httpResponse.statusCode)
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        print("📩 Raw JSON:", String(data: data, encoding: .utf8) ?? "empty")

        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("❌ Decoding error:", error)
            throw NetworkError.decodingError
        }
    }
}
// 200-299, 400, 401, 500, else

