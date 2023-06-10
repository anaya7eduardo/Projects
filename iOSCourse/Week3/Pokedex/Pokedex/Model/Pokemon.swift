//
//  Pokemon.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import Foundation

struct Raw: Codable {
    let results: [Pokemon]
    let next: String
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case next = "next"
    }
}

struct Pokemon: Codable {
    let name, url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

/*
struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable {
    let id = UUID()
    var name: String
    var url: String
}

class PokeAPI {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = APIEndpoints.pokedexAPI else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }.resume()
    }
}
*/
