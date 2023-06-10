//
//  Brewery.swift
//  BreweryWithGenerics
//
//  Created by Eduardo Anaya on 12/2/21.
//

import Foundation

struct Brewery: Codable {
    let name: String
    let city: String
    let state: String!
//
//    enum CodingKeys:String, CodingKey {
//        case name = "name"
//        case city = "city"
//        //case state = ""
//    }
}
