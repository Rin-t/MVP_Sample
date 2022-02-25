//
//  Pokemon.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Images
    let types: [Types]
}

struct Images: Codable {
    let frontImage: String
    let shinyImage: String

    enum CodingKeys: String, CodingKey {
        case frontImage = "front_default"
        case shinyImage = "front_shiny"
    }
}

struct Types: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}
