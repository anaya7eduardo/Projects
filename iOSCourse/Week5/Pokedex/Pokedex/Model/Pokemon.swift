//
//  Pokemon.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import Foundation

struct Raw: Decodable {
    let results: [Pokemon]
    let next: String
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case next = "next"
    }
}

struct Pokemon: Decodable {
    let name, url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
