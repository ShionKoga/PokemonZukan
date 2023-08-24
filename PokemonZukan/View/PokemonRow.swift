import SwiftUI

struct PokemonRow: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: viewModel.imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(.gray)
                        .frame(width: 50)
                }
            }
            Text(viewModel.name)
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(viewModel: .init(pokemon: Pokemon(name: "pokemon", url: "https://pokeapi.co/api/v2/pokemon/1/")))
    }
}
