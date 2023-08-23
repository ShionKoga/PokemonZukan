import SwiftUI

struct PokemonRow: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.name)
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(viewModel: .init(pokemon: Pokemon(name: "pokemon")))
    }
}
