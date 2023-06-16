//
//  FavoritesView.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    var body: some View {
        List {
            ForEach(coreDataViewModel.savedEntities) { entity in
                NavigationLink {
                    SelectedFavoriteView(favoriteTitle: entity.name!, favoriteImage: entity.thumb!, favoriteDetails: entity.details!, favoriteIngredients: entity.ingredients!, favoriteRecipe: entity.recipe!)
                } label: {
                    HStack {
                        favoritesViewModel.loadImage(imageURL: entity.thumb!, frameWidth: 35.0, frameHeight: 35.0, radius: 5.0)
                        Text(entity.name!)
                    }
                }
            }.onDelete(perform: coreDataViewModel.deleteCocktail)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
