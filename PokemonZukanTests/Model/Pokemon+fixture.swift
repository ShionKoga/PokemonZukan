@testable import PokemonZukan

extension Pokemon {
    static func fixture(
        name: String = "",
        url: String = "https://pokeapi.co/api/v2/pokemon/1/"
    ) -> Pokemon {
        return Pokemon(name: name, url: url)
    }
}
