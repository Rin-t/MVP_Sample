//
//  ApiClient.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

struct ApiClient {

    static func fetchData<T: Decodable>(urls: [URL]) async throws -> [T] {
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


