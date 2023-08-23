

struct Pokemon: Identifiable, Decodable {
    var id: String { name }
    let name: String
}

struct PokeAPIResponse: Decodable {
    let results: [Pokemon]
}
