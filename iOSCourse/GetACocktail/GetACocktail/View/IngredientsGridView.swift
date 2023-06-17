//
//  IngredientsGridView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/16/23.
//

import SwiftUI

struct IngredientsGridView: View {
    @StateObject var ingredientsGridViewModel: IngredientsGridViewModel = IngredientsGridViewModel(networkManager: NetworkManager())
    
    @State private var searchText = ""
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var allIngredients: [Ingredient] {
        searchText.isEmpty ? ingredientsGridViewModel.ingredientList.sorted{ $0.strIngredient1 < $1.strIngredient1 } : ingredientsGridViewModel.ingredientList.filter{ $0.strIngredient1.contains(searchText) }
    }
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(allIngredients) { liquor in
                        NavigationLink {
                            SelectedIngredientGridView(ingredient: liquor)
                        } label: {
                            IngredientsGridCellView(cellData: liquor.strIngredient1)
                        }
                    }
                }
            }.navigationTitle("Ingredients")
        }.onAppear {
            ingredientsGridViewModel.getIngredientList(urlString: APIEndpoints.listIngredientsAPI)
        }.padding()
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct IngredientsGridView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsGridView()
    }
}
