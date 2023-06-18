//
//  SelectedIngredientGridCellView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/17/23.
//

import SwiftUI

struct SelectedIngredientGridCellView: View {
    
    @StateObject var ingredientsGridViewModel: IngredientsGridViewModel = IngredientsGridViewModel(networkManager: NetworkManager())
    
    var thumb: String
    var drink: String
    
    var body: some View {
        VStack {
            ingredientsGridViewModel.loadImage(imageURL: thumb, frameWidth: 115.0, frameHeight: 115.0, radius: 15.0)
                .overlay(Text(drink)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black, radius: 3, x: 0, y: 2))
        }
        .padding()
    }
}

//struct SelectedIngredientGridCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedIngredientGridCellView(thumb: "Thumb", drink: "Drink")
//    }
//}
