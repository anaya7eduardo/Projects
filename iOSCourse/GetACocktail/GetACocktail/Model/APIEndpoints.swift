//
//  APIEndpoints.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import Foundation

struct APIEndpoints {
    static let baseAPI = "https://www.thecocktaildb.com/api/json/v1/1/"
    static let randomCocktailAPI = "\(baseAPI)random.php"
//    static let cocktailByIdAPI = "\(baseAPI)lookup.php?i="
    
    static let cocktailList = "\(baseAPI)filter.php?a=Alcoholic"
    
    static func cocktailByIdAPI(id: String) -> URL? {
        let urlString = "\(baseAPI)lookup.php?i=\(id)"
        return URL(string: urlString)
    }
}
