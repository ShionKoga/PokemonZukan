@testable import PokemonZukan
import Foundation
import Combine

class DummyPokemonRepository: PokemonRepository {
    func getPokemon(limit: Int, offset: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        return Future { $0(.success([])) }
            .eraseToAnyPublisher()
    }
}

class StubPokemonRepository: PokemonRepository {
    var getPokemon_returnValue: Result<[Pokemon], Error> = .success([])
    func getPokemon(limit: Int, offset: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        return Future { $0(self.getPokemon_returnValue) }
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

class SpyPokemonRepository: PokemonRepository {
    var getPokemon_argument_limit: Int? = nil
    var getPokemon_argument_offset: Int? = nil
    func getPokemon(limit: Int, offset: Int) -> AnyPublisher<[PokemonZukan.Pokemon], Error> {
        getPokemon_argument_limit = limit
        getPokemon_argument_offset = offset
        return Future { $0(.success([])) }
            .eraseToAnyPublisher()
    }
}
