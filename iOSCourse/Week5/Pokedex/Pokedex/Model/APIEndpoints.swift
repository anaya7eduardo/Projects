//
//  APIEndpoints.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import Foundation

struct APIEndpoints {
    //https://pokeapi.co/api/v2/pokemon?limit=151
    //https://pokeapi.co/api/v2/pokemon?offset=0&limit=30
    static let pokedexAPI = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30")
}
