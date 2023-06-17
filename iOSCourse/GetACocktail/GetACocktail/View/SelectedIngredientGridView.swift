//
//  SelectedIngredientGridView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/16/23.
//

import SwiftUI

struct SelectedIngredientGridView: View {
    
    @StateObject var ingredientsGridViewModel: IngredientsGridViewModel = IngredientsGridViewModel(networkManager: NetworkManager())
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let ingredient: Ingredient
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(ingredientsGridViewModel.cocktailList, id: \.idDrink) { cocktail in
                        NavigationLink {
                            SelectedIngredientCocktailView(idDrink: cocktail.idDrink)
                        } label: {
                            SelectedIngredientGridCellView(thumb: cocktail.strDrinkThumb, drink: cocktail.strDrink)
                        }
                    }
                }
            }.navigationTitle(ingredient.strIngredient1)
        }.onAppear {
            ingredientsGridViewModel.getCocktailByIngredient(for: ingredientsGridViewModel.replaceWhitespaces(ingredient.strIngredient1))
        }.padding()
    }
}

//struct SelectedIngredientGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedIngredientGridView()
//    }
//}
