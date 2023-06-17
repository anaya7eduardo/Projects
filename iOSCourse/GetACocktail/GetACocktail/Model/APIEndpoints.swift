//
//  APIEndpoints.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import Foundation

struct APIEndpoints {
    static let baseAPI = "https://www.thecocktaildb.com/api/json/v1/1/"
    static let filterBaseAPI = "\(baseAPI)filter.php?"
    static let randomCocktailAPI = "\(baseAPI)random.php"
    static let listIngredientsAPI = "\(baseAPI)list.php?i=list"
    
    static let cocktailList = "\(filterBaseAPI)a=Alcoholic"
    
    static func cocktailByIdAPI(id: String) -> URL? {
        let urlString = "\(baseAPI)lookup.php?i=\(id)"
        return URL(string: urlString)
    }
    
    static func cocktailByIngredient(ingredient: String) -> URL? {
        let urlString = "\(filterBaseAPI)i=\(ingredient)"
        return URL(string: urlString)
    }
}
