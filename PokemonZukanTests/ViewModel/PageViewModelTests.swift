@testable import PokemonZukan
import XCTest
import Combine

class PageViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    func test_初期値としてポケモンの空配列をパブリッシュする() {
        let viewModel = PageView.ViewModel(
            page: 0,
            pokemonRepository: DummyPokemonRepository()
        )
        
        
        XCTAssertEqual(0, viewModel.pokemons.count)
    }
    
    func test_RepositoryのgetPokemonに正しく引数を渡して実行する() {
        let spyPokemonRepository = SpyPokemonRepository()
        _ = PageView.ViewModel(
            page: 0,
            pokemonRepository: spyPokemonRepository
        )
        
        
        XCTAssertEqual(10, spyPokemonRepository.getPokemon_argument_limit)
        XCTAssertEqual(0, spyPokemonRepository.getPokemon_argument_offset)
    }
    
    func test_Repositoryに渡す引数がページによって動的に変わる() {
        let spyPokemonRepository = SpyPokemonRepository()
        _ = PageView.ViewModel(
            page: 3,
            pokemonRepository: spyPokemonRepository
        )
        
        
        XCTAssertEqual(10, spyPokemonRepository.getPokemon_argument_limit)
        XCTAssertEqual(30, spyPokemonRepository.getPokemon_argument_offset)
    }
    
    func test_Repositoryから帰ってきたポケモンの配列をパブリッシュする() {
        let stubPokemonRepository = StubPokemonRepository()
        stubPokemonRepository.getPokemon_returnValue = .success([
            Pokemon.fixture(name: "pokemon1"),
            Pokemon.fixture(name: "pokemon2"),
        ])
        let viewModel = PageView.ViewModel(
            page: 0,
            pokemonRepository: stubPokemonRepository
        )
        
        
        let expectation = XCTestExpectation()
        viewModel.$pokemons
            .dropFirst()
            .sink { pokemons in
                XCTAssertEqual(2, pokemons.count)
                XCTAssertEqual("pokemon1", pokemons.first?.name)
                XCTAssertEqual("pokemon2", pokemons.last?.name)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}
