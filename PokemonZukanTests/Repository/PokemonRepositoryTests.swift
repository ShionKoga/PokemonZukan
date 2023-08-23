@testable import PokemonZukan
import XCTest
import Combine


class PokemonRepositoryTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    func test_httpに正しく引数を渡して実行している() {
        let spyHttp = SpyHttp()
        let repository = DefaultPokemonRepository(http: spyHttp)
        
        
        _ = repository.getPokemon(limit: 10, offset: 30)
        
        
        XCTAssertEqual(
            "https://pokeapi.co/api/v2/pokemon?limit=10&offset=30",
            spyHttp.executeRequest_argument_request?.url?.absoluteString
        )
        XCTAssertEqual("GET", spyHttp.executeRequest_argument_request?.httpMethod)
    }
    
    func test_httpの返り値をデコードして返す() throws {
        let stubHttp = StubHttp()
        let json = """
        {
            "results": [
                {
                    "name": "bulbasaur"
                },
                {
                    "name": "ivysaur"
                }
            ]
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        stubHttp.executeRequest_returnValue = .success(data)
        let repository = DefaultPokemonRepository(http: stubHttp)
        
        
        let expectation = XCTestExpectation()
        repository.getPokemon(limit: 0, offset: 0)
            .sink(receiveCompletion: { _ in }) { pokemons in
                XCTAssertEqual("bulbasaur", pokemons.first?.name)
                XCTAssertEqual("ivysaur", pokemons.last?.name)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}
