//
//  Cocktail.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import Foundation

// MARK: - Cocktail
struct Cocktail: Decodable {
    let drinks: [CocktailInfo]
}

// MARK: - Drink
struct CocktailInfo: Hashable, Decodable {
    let strDrink: String
    let strDrinkAlternate: String?
    let strCategory, strAlcoholic, strGlass, strInstructions: String
    let strDrinkThumb: String
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
        strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
        strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
        strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
        strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15: String?
    
    enum CodingKeys: String, CodingKey {
        case strDrink, strDrinkAlternate, strCategory, strAlcoholic, strGlass, strInstructions, strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
    }
}

extension CocktailInfo {
    func strIngredientValue(forKey key: String) -> String? {
        switch key {
        case "strIngredient1": return strIngredient1
        case "strIngredient2": return strIngredient2
        case "strIngredient3": return strIngredient3
        case "strIngredient4": return strIngredient4
        case "strIngredient5": return strIngredient5
        case "strIngredient6": return strIngredient6
        case "strIngredient7": return strIngredient7
        case "strIngredient8": return strIngredient8
        case "strIngredient9": return strIngredient9
        case "strIngredient10": return strIngredient10
        case "strIngredient11": return strIngredient11
        case "strIngredient12": return strIngredient12
        case "strIngredient13": return strIngredient13
        case "strIngredient14": return strIngredient14
        case "strIngredient15": return strIngredient15
        
        default: return nil
        }
    }
    
    func strMeasureValue(forKey key: String) -> String? {
        switch key {
        case "strMeasure1": return strMeasure1
        case "strMeasure2": return strMeasure2
        case "strMeasure3": return strMeasure3
        case "strMeasure4": return strMeasure4
        case "strMeasure5": return strMeasure5
        case "strMeasure6": return strMeasure6
        case "strMeasure7": return strMeasure7
        case "strMeasure8": return strMeasure8
        case "strMeasure9": return strMeasure9
        case "strMeasure10": return strMeasure10
        case "strMeasure11": return strMeasure11
        case "strMeasure12": return strMeasure12
        case "strMeasure13": return strMeasure13
        case "strMeasure14": return strMeasure14
        case "strMeasure15": return strMeasure15
            
        default: return nil
        }
    }
}

/*
{
  "drinks": [
    {
      "strDrink":"String",
      "strDrinkAlternate":null OR String,
      "strCategory":"String",
      "strAlcoholic":"String",
      "strGlass":"String",
      "strInstructions":"String",
      "strDrinkThumb":"URLString",
      "strIngredient1":"String",
        ...
      "strIngredient15":null OR String,
      "strMeasure1":"String",
        ...
      "strMeasure15":null OR String
    }
  ]
}
*/
