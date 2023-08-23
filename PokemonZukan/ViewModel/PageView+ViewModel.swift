import Combine
import Foundation


extension PageView {
    class ViewModel: ObservableObject {
        @Published var pokemons = [Pokemon]()
        private var cancellables = Set<AnyCancellable>()
        
        init(
            page: Int,
            pokemonRepository: PokemonRepository = DefaultPokemonRepository()
        ) {
            pokemonRepository.getPokemon(limit: 10, offset: page * 10)
                .sink(receiveCompletion: { _ in }) { pokemons in
                    DispatchQueue.main.async {
                        self.pokemons = pokemons
                    }
                }
                .store(in: &cancellables)
        }
    }
}
