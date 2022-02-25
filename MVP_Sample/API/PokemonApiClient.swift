//
//  PokemonApiClient.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

final class PokemonApiClient {
    
    static func fetchPokemonList() async throws -> [Pokemon] {
        let idRange = Constants.searchPokemonIdRange
        let urls = try idRange.map { (id: Int) -> URL in
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
                throw ApiCallError.invalidURL
            }
            return url
        }
        var pokemons: [Pokemon] = try await ApiClient.fetchData(urls: urls)
        pokemons.sort(by: { $0.id < $1.id })
        return pokemons
    }
}
