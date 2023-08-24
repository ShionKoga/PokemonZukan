

struct Pokemon: Identifiable, Decodable {
    var id: String {
        url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
            .replacingOccurrences(of: "/", with: "")
    }
    let name: String
    let url: String
}

struct PokeAPIResponse: Decodable {
    let results: [Pokemon]
}
