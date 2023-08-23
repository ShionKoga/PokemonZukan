import Combine
import Foundation

protocol Http {
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}

extension URLSession: Http {
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
