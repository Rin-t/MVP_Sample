//
//  ApiClient.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

final class ApiClient {

    func fetchPokemonList() async -> [Pokemon] {

        let idRange = 1...5
        let urls = idRange.map { (id: Int) -> URL in
            let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
            return url
        }

        do {
            var pokemons: [Pokemon] = try await fetchData(urls: urls)
            pokemons.sort(by: { $0.id < $1.id })
            return pokemons

        } catch {
            print("error")
            return []
        }
    }

    private func fetchData<T: Decodable>(urls: [URL]) async throws -> [T] {

        var results = [T]()
        do {
            try await withThrowingTaskGroup(of: (Data, URLResponse).self) { group in
                for url in urls {
                    group.addTask(priority: nil) {
                        try await URLSession.shared.data(from: url)
                    }
                }

                for try await (data, _) in group {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    results.append(result)
                }
            }
        } catch {
            print("error")
        }
        return results
    }
}


