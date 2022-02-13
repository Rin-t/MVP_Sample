//
//  PokemonApiClient.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

final class PokemonApiClient {
    
    func fetchPokemonList() async -> [Pokemon] {

        let idRange = 1...5
        let urls = idRange.map { (id: Int) -> URL in
            let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
            return url
        }

        do {
            var pokemons: [Pokemon] = try await ApiClient.fetchData(urls: urls)
            pokemons.sort(by: { $0.id < $1.id })
            return pokemons

        } catch {
            print("error")
            return []
        }
    }
}
