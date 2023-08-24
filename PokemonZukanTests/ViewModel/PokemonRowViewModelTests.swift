@testable import PokemonZukan
import XCTest

class PokemonRowViewModelTests: XCTestCase {
    func test_ポケモンの名前を表示する() {
        let viewModel = PokemonRow.ViewModel(
            pokemon: Pokemon.fixture(name: "pokemon")
        )
        
        
        XCTAssertEqual("pokemon", viewModel.name)
    }
    
    func test_ポケモン画像を表示する() {
        let viewModel = PokemonRow.ViewModel(
            pokemon: Pokemon.fixture(url: "https://pokeapi.co/api/v2/pokemon/1/")
        )
        
        
        XCTAssertEqual(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
            viewModel.imageURL?.absoluteString
        )
    }
}
