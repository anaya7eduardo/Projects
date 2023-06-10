//
//  PokemonSprite.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/6/21.
//

import Foundation
//MARK: -PokemonSelected
struct PokemonSelected: Decodable {
    let abilities: [Abilities]
    let height: Int
    let id: Int
    let moves: [Moves]
    let name: String
    let sprites: Sprites!
    let types: [Types]
    let weight: Int
    enum CodingKeys: String, CodingKey {
        case abilities = "abilities"
        case height = "height"
        case id = "id"
        case moves = "moves"
        case name = "name"
        case sprites = "sprites"
        case types = "types"
        case weight = "weight"
    }
}
//MARK: -Abilities
struct Abilities: Decodable {
    let ability: Ability
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
}

struct Ability: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
//MARK: -Moves
struct Moves: Decodable {
    let move: Move
    enum CodingKeys: String, CodingKey {
        case move = "move"
    }
}

struct Move: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
//MARK: -Sprites
struct Sprites: Decodable {
    let front_default: URL
    let front_shiny: URL
    let other: Other
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
        case front_shiny = "front_shiny"
        case other = "other"
    }
}

struct Other: Decodable {
    let home: Home
    let artwork: Artwork
    enum CodingKeys: String, CodingKey {
        case home = "home"
        case artwork = "official-artwork"
    }
}

struct Home: Decodable {
    let home_front: URL
    let home_shiny: URL
    enum CodingKeys: String, CodingKey {
        case home_front = "front_default"
        case home_shiny = "front_shiny"
    }
}

struct Artwork: Decodable {
    let official_front: URL
    enum CodingKeys: String, CodingKey {
        case official_front = "front_default"
    }
}
//MARK: -Types
struct Types: Decodable {
    let typ: Typ
    enum CodingKeys: String, CodingKey {
        case typ = "type"
    }
}

struct Typ: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
