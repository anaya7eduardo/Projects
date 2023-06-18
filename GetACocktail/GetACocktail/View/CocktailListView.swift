//
//  CocktailListView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/15/23.
//

import SwiftUI

struct CocktailListView: View {
    
    @StateObject var cocktailListViewModel: CocktailListViewModel = CocktailListViewModel(networkManager: NetworkManager())
    
    var body: some View {
        List {
            ForEach(cocktailListViewModel.cocktailList, id: \.idDrink) { cocktail in
                NavigationLink {
                    SelectedCocktailListView(cocktailID: cocktail.idDrink)
                } label: {
                    HStack {
                        cocktailListViewModel.loadImage(imageURL: cocktail.strDrinkThumb, frameWidth: 75.0, frameHeight: 75.0, radius: 7.0)
                        Text(cocktail.strDrink)
                    }
                }
            }
        }.onAppear {
            cocktailListViewModel.getCocktailList(urlString: APIEndpoints.cocktailList)
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView()
    }
}
