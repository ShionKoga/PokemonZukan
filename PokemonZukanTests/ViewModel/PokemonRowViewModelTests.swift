@testable import PokemonZukan
import XCTest

class PokemonRowViewModelTests: XCTestCase {
    func test_ポケモンの名前を表示する() {
        let viewModel = PokemonRow.ViewModel(
            pokemon: Pokemon.fixture(name: "pokemon")
        )
        
        
        XCTAssertEqual("pokemon", viewModel.name)
    }
}
