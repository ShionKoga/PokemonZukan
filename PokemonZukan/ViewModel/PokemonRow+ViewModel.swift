import Combine
import Foundation

extension PokemonRow {
    class ViewModel: ObservableObject {
        let name: String
        init(pokemon: Pokemon) {
            self.name = pokemon.name
        }
    }
}
