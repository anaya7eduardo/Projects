//
//  SelectedFavoriteView.swift
//  GetACocktail
//
//  Created by unkn0wn on 4/3/23.
//

import SwiftUI

struct SelectedFavoriteView: View {
    
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    let favoriteTitle: String
    let favoriteImage: String
    let favoriteDetails: String
    let favoriteIngredients: String
    let favoriteRecipe: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text(favoriteTitle)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            HStack {
                VStack {
                    favoritesViewModel.loadImage(imageURL: favoriteImage, frameWidth: 150.0, frameHeight: 150.0, radius: 15.0)
                }
                .frame(width: 140.0, height: 140.0)
                .padding(10.0)
                .background(.teal)
                .cornerRadius(15.0)
                
                VStack(alignment: .center) {
                    Text(favoriteDetails)
                }
                .frame(maxWidth: .infinity, minHeight: 100.0)
                .padding(30.0)
                .background(.yellow)
                .cornerRadius(20.0)
            }
            
            ScrolledView(text: favoriteIngredients)
            
            ScrolledView(text: favoriteRecipe)
            
        }.padding()
            .foregroundColor(favoritesViewModel.textColor(colorScheme))
    }
    
}

struct ScrolledView: View {
    let text: String
    
    var body: some View {
        ScrollView {
            Text(text)
        }
        .font(.headline)
        .frame(maxWidth: .infinity, minHeight: 150)
        .padding(15)
        .background(.gray)
        .cornerRadius(20)
    }
}

//struct SelectedFavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedFavoriteView(favoriteTitle: "Title", favoriteImage: "Image", favoriteDetails: "Details", favoriteIngredients: "Ingredients", favoriteRecipe: "Recipe")
//    }
//}
