//
//  Brewery.swift
//  BreweryFetch
//
//  Created by Eduardo Anaya on 11/30/21.
//

import Foundation

class Brewery {
    var name:String
    var type:String
    var city:String
    var state:String
    var street:String
    
    init(name:String, type:String, city:String, state:String, street:String) {
        self.name = name
        self.type = type
        self.city = city
        self.state = state
        self.street = street
    }
}
