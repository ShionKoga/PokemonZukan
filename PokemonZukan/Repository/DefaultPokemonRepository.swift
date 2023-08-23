import Combine
import Foundation


protocol PokemonRepository {
    func getPokemon(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error>
}

class DefaultPokemonRepository: PokemonRepository {
    private let http: Http
    
    init(http: Http = URLSession.shared) {
        self.http = http
    }
    
    func getPokemon(limit: Int, offset: Int) -> AnyPublisher<[Pokemon], Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)")
        let request = URLRequest(url: url!)
        return http.executeRequest(request)
            .decode(type: PokeAPIResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
