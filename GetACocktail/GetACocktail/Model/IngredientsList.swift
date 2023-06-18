//
//  IngredientsList.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/17/23.
//

import Foundation

// MARK: - IngredientList
struct IngredientList: Codable {
    let drinks: [Ingredient]
}

// MARK: - Ingredient
struct Ingredient: Codable, Identifiable {
    let id = UUID()
    let strIngredient1: String
}
