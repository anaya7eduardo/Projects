//
//  PokemonSprite.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/6/21.
//

import Foundation
//MARK: -PokemonSelected
struct PokemonSelected: Codable {
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
struct Abilities: Codable {
    let ability: Ability
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
}

struct Ability: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
//MARK: -Moves
struct Moves: Codable {
    let move: Move
    enum CodingKeys: String, CodingKey {
        case move = "move"
    }
}

struct Move: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
//MARK: -Sprites
struct Sprites: Codable {
    let front: URL
    //let other: [Other]
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
        //case other = "other"
    }
}
//MARK: -Types
struct Types: Codable {
    let typ: Typ
    enum CodingKeys: String, CodingKey {
        case typ = "type"
    }
}

struct Typ: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

/*
struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var front_default: String?
}

class PokemonSelectedApi  {
    func getSprite(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}
*/
