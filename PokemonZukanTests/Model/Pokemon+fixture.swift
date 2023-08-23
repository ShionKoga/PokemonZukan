@testable import PokemonZukan

extension Pokemon {
    static func fixture(
        name: String = ""
    ) -> Pokemon {
        return Pokemon(name: name)
    }
}
