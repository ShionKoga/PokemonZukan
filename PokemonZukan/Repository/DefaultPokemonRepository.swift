import Combine
import Foundation


protocol PokemonRepository {
    func getPokemon(at startIndex: Int, to endIndex: Int) -> AnyPublisher<[Pokemon], Error>
}

class DefaultPokemonRepository: PokemonRepository {
    private let http: Http
    
    init(http: Http = URLSession.shared) {
        self.http = http
    }
    
    func getPokemon(at startIndex: Int, to endIndex: Int) -> AnyPublisher<[Pokemon], Error> {
        return Future { $0(.success([])) }
            .eraseToAnyPublisher()
    }
}
