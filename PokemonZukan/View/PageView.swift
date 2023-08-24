import SwiftUI

struct PageView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.pokemons, id: \.id) { pokemon in
                PokemonRow(viewModel: .init(pokemon: pokemon))
            }
        }
        .listStyle(.plain)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(viewModel: .init(page: 0))
    }
}
