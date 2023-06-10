//
//  Cocktail.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/3/22.
//

import Foundation

// MARK: - CocktailsModel
struct DrinksModel: Decodable {
    let drinks: [Drink]
}

// MARK: - Cocktail
struct Drink: Decodable {
    let strDrink: String
    let strDrinkAlternate: String?
    let strCategory, strAlcoholic, strGlass, strInstructions: String
    let strDrinkThumb: URL
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
