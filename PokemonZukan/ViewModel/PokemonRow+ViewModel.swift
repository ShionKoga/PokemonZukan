import Combine
import Foundation

extension PokemonRow {
    class ViewModel: ObservableObject {
        let name: String
        let imageURL: URL?
        init(pokemon: Pokemon) {
            self.name = pokemon.name
            self.imageURL = URL(
                string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemon.id).png"
            )
        }
    }
}
