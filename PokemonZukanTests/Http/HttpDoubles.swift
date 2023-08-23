@testable import PokemonZukan
import Combine
import Foundation


class SpyHttp: Http {
    var executeRequest_argument_request: URLRequest? = nil
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        executeRequest_argument_request = request
        return Future { $0(.success(Data())) }
            .eraseToAnyPublisher()
    }
}

class StubHttp: Http {
    var executeRequest_returnValue: Result<Data, URLError> = .success(Data())
    func executeRequest(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return Future { $0(self.executeRequest_returnValue) }
            .eraseToAnyPublisher()
    }
}
