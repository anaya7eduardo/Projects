//
//  CocktailList.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/15/23.
//

import Foundation

// MARK: - CocktailList
struct CocktailList: Codable {
    let drinks: [Drink]
}

// MARK: - Drink
struct Drink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}

/*
{
    "drinks": [
        {
        "strDrink":"1-900-FUK-MEUP",
        "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/uxywyw1468877224.jpg",
        "idDrink":"15395"
        },
        {
        "strDrink":"110 in the shade",
        "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/xxyywq1454511117.jpg",
        "idDrink":"15423"
        },
        {
        "strDrink":"151 Florida Bushwacker",
        "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/rvwrvv1468877323.jpg",
        "idDrink":"14588"
        }
    ]
 }
 */
