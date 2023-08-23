@testable import PokemonZukan
import Foundation
import Combine

class DummyPokemonRepository: PokemonRepository {
    func getPokemon(at startIndex: Int, to endIndex: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        return Future { $0(.success([])) }
            .eraseToAnyPublisher()
    }
}

class StubPokemonRepository: PokemonRepository {
    var getPokemon_returnValue: Result<[Pokemon], Error> = .success([])
    func getPokemon(at startIndex: Int, to endIndex: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        return Future { $0(self.getPokemon_returnValue) }
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

class SpyPokemonRepository: PokemonRepository {
    var getPokemon_argument_at: Int? = nil
    var getPokemon_argument_to: Int? = nil
    func getPokemon(at startIndex: Int, to endIndex: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        getPokemon_argument_at = startIndex
        getPokemon_argument_to = endIndex
        return Future { $0(.success([])) }
            .eraseToAnyPublisher()
    }
}
