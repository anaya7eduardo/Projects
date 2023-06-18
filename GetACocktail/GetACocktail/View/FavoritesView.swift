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
    
    @State private var showAlert = false
    
    var body: some View {
        
        var totalCocktails = coreDataViewModel.savedEntities.count
        
        VStack {
            if totalCocktails > 0 {
                Text("Favorites: \(totalCocktails)")
            }
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
                }
                .onDelete(perform: coreDataViewModel.deleteCocktail)
            }
            if totalCocktails > 9 {
                Button(action: {
                    showAlert = true
                }) {
                    Text("Delete All")
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Warning"),
                        message: Text("Are you sure you want to delete all entries?"),
                        primaryButton: .destructive(Text("Yes, Delete All (\(totalCocktails))"), action: {
                            coreDataViewModel.deleteAllCocktails()
                        }),
                        secondaryButton: .cancel(Text("No, Cancel"))
                    )
                }
            }
        }
        .toolbar {
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
