@testable import PokemonZukan

extension Pokemon {
    static func fixture(
        id: Int = 0
    ) -> Pokemon {
        return Pokemon(id: id)
    }
}
