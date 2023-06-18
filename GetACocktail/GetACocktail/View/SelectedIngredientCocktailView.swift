//
//  SelectedIngredientCocktailView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/16/23.
//

import SwiftUI

struct SelectedIngredientCocktailView: View {
    
    @StateObject var selectedIngredientCocktailViewModel: IngredientsGridViewModel = IngredientsGridViewModel(networkManager: NetworkManager())
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    let cocktailID: String
    
    @State var cocktailName: String = ""
    @State var cocktailThumb: String = ""
    @State var cocktailDetails: String = ""
    @State var cocktailIngredients: String = ""
    @State var cocktailRecipe: String = ""
    
    @State private var buttonDisabled: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var alertTitle: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ForEach(selectedIngredientCocktailViewModel.cocktail, id: \.self) { cocktail in
                HStack {
                    let strDrink = cocktail.strDrink.capitalized
                    Text(strDrink)
                        .font(.system(size: selectedIngredientCocktailViewModel.textSize(for: strDrink), design: .rounded))
                        .fontWeight(.black)
                        .scaledToFit()
                }
                .frame(height: 50.0)
                HStack {
                    VStack {
                        selectedIngredientCocktailViewModel.loadImage(imageURL: cocktail.strDrinkThumb, frameWidth: 150.0, frameHeight: 150.0, radius: 15.0)
                    }
                    .frame(width: 140.0, height: 140.0)
                    .padding(10.0)
                    .background(.teal)
                    .cornerRadius(15.0)
                    
                    VStack(alignment: .center) {
                        if let alternate = cocktail.strDrinkAlternate {
                            Text(alternate)
                        }
                        
                        if cocktail.strCategory != "Other/Unknown" {
                            Text(cocktail.strCategory)
                        }
                        
                        Text(cocktail.strAlcoholic)
                        Text(cocktail.strGlass)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100.0)
                    .padding(30.0)
                    .background(.yellow)
                    .cornerRadius(20.0)
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())]) {
                        Group {
                            if let cocktail1 = cocktail.strIngredient1 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure1, cocktail1))")
                            }
                            if let cocktail2 = cocktail.strIngredient2 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure2, cocktail2))")
                            }
                            if let cocktail3 = cocktail.strIngredient3 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure3, cocktail3))")
                            }
                            if let cocktail4 = cocktail.strIngredient4 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure4, cocktail4))")
                            }
                            if let cocktail5 = cocktail.strIngredient5 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure5, cocktail5))")
                            }
                        }
                        Group {
                            if let cocktail6 = cocktail.strIngredient6 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure6, cocktail6))")
                            }
                            if let cocktail7 = cocktail.strIngredient7 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure7, cocktail7))")
                            }
                            if let cocktail8 = cocktail.strIngredient8 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure8, cocktail8))")
                            }
                            if let cocktail9 = cocktail.strIngredient9 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure9, cocktail9))")
                            }
                            if let cocktail10 = cocktail.strIngredient10 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure10, cocktail10))")
                            }
                        }
                        Group {
                            if let cocktail11 = cocktail.strIngredient11 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure11, cocktail11))")
                            }
                            if let cocktail12 = cocktail.strIngredient12 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure12, cocktail12))")
                            }
                            if let cocktail13 = cocktail.strIngredient13 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure13, cocktail13))")
                            }
                            if let cocktail14 = cocktail.strIngredient14 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure14, cocktail14))")
                            }
                            if let cocktail15 = cocktail.strIngredient15 {
                                Text("\(selectedIngredientCocktailViewModel.formatText(cocktail.strMeasure15, cocktail15))")
                            }
                        }
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding(15)
                .background(.gray)
                .cornerRadius(20)
                
                ScrollView {
                    Text(cocktail.strInstructions.capitalized)
                }
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding(15)
                .background(.gray)
                .cornerRadius(20)
                
                Button(action: {
                    cocktailName = cocktail.strDrink.capitalized
                    cocktailThumb = "\(cocktail.strDrinkThumb)"
                    
                    if cocktail.strCategory != "Other/Unknown" {
                        cocktailDetails = "\(cocktail.strCategory)\n\(cocktail.strAlcoholic)\n\(cocktail.strGlass)"
                    } else {
                        cocktailDetails = "\(cocktail.strAlcoholic)\n\(cocktail.strGlass)"
                    }
                    
                    for i in 1...15 {
                        let ingredientKey = "strIngredient\(i)"
                        let measureKey = "strMeasure\(i)"
                        
                        if let ingredient = cocktail.strIngredientValue(forKey: ingredientKey),
                           let measure = cocktail.strMeasureValue(forKey: measureKey) {
                            if i == 1 {
                                cocktailIngredients = "\(selectedIngredientCocktailViewModel.formatText(measure, ingredient))"
                            } else {
                                cocktailIngredients.append("\n\(selectedIngredientCocktailViewModel.formatText(measure, ingredient))")
                            }
                        }
                    }
                    
                    cocktailRecipe = cocktail.strInstructions.capitalized
                    
                    //print(cocktailName + "\n" + cocktailThumb + "\n" + cocktailDetails + "\n" + cocktailIngredients + "\n" + cocktailRecipe)
                    
                    if coreDataViewModel.savedEntities.contains(where: { $0.name == cocktailName }) {
                        showAlert = true
                        alertTitle = "Warning ⚠️"
                        alertMessage = "\(cocktailName) is already a favorite"
                    } else {
                        coreDataViewModel.addCocktail(
                            name: cocktailName,
                            thumb: cocktailThumb,
                            details: cocktailDetails,
                            ingredients: cocktailIngredients,
                            recipe: cocktailRecipe)
                        showAlert = true
                        alertTitle = "Success ❤️"
                        alertMessage = "\(cocktailName) saved as favorite"
                    }
                    buttonDisabled.toggle()
                }) {
                    Text("Favorite")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(.purple)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }
                .padding(.top, 15)
                .padding(.horizontal)
                .disabled(buttonDisabled)
            }
        }
        .onAppear {
            selectedIngredientCocktailViewModel.getCocktailByID(for: cocktailID)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .foregroundColor(selectedIngredientCocktailViewModel.textColor(colorScheme))
        .padding()
    }
    
}

//struct SelectedIngredientCocktailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedIngredientCocktailView(idDrink: "ID Drink")
//    }
//}
