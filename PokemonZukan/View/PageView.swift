import SwiftUI

struct PageView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.pokemons, id: \.id) { pokemon in
                PokemonRow(viewModel: .init(pokemon: pokemon))
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(viewModel: .init(page: 0))
    }
}
