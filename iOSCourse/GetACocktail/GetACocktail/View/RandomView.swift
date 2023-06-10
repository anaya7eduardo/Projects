//
//  RandomView.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import SwiftUI

struct RandomView: View {
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var randomViewModel: RandomViewModel = RandomViewModel(networkManager: NetworkManager())
    
    @State var cocktailName: String = ""
    @State var cocktailThumb: String = ""
    @State var cocktailDetails: String = ""
    @State var cocktailIngredients: String = ""
    @State var cocktailRecipe: String = ""
    
    @State private var buttonDisabled: Bool = false
    
    var body: some View {
        VStack {
            ForEach(randomViewModel.cocktailList, id: \.self) { cocktail in
                Text(cocktail.strDrink.capitalized)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                
                HStack {
                    VStack {
                        URLImage(urlString: "\(cocktail.strDrinkThumb)", width: 150.0, height: 150.0, radius: 15.0)
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
                            Text(cocktail.strAlcoholic)
                            Text(cocktail.strGlass)
                        } else {
                            Text(cocktail.strAlcoholic)
                            Text(cocktail.strGlass)
                        }
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
                                Text("\(cocktail.strMeasure1?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail1)")
                            }
                            if let cocktail2 = cocktail.strIngredient2 {
                                Text("\(cocktail.strMeasure2?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail2)")
                            }
                            if let cocktail3 = cocktail.strIngredient3 {
                                Text("\(cocktail.strMeasure3?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail3)")
                            }
                            if let cocktail4 = cocktail.strIngredient4 {
                                Text("\(cocktail.strMeasure4?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail4)")
                            }
                            if let cocktail5 = cocktail.strIngredient5 {
                                Text("\(cocktail.strMeasure5?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "")  \(cocktail5)")
                            }
                        }
                        Group {
                            if let cocktail6 = cocktail.strIngredient6 {
                                Text("\(cocktail.strMeasure6?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail6)")
                            }
                            if let cocktail7 = cocktail.strIngredient7 {
                                Text("\(cocktail.strMeasure7?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail7)")
                            }
                            if let cocktail8 = cocktail.strIngredient8 {
                                Text("\(cocktail.strMeasure8?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail8)")
                            }
                            if let cocktail9 = cocktail.strIngredient9 {
                                Text("\(cocktail.strMeasure9?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail9)")
                            }
                            if let cocktail10 = cocktail.strIngredient10 {
                                Text("\(cocktail.strMeasure10?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail10)")
                            }
                        }
                        Group {
                            if let cocktail11 = cocktail.strIngredient11 {
                                Text("\(cocktail.strMeasure11?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail11)")
                            }
                            if let cocktail12 = cocktail.strIngredient12 {
                                Text("\(cocktail.strMeasure12?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail12)")
                            }
                            if let cocktail13 = cocktail.strIngredient13 {
                                Text("\(cocktail.strMeasure13?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail13)")
                            }
                            if let cocktail14 = cocktail.strIngredient14 {
                                Text("\(cocktail.strMeasure14?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail14)")
                            }
                            if let cocktail15 = cocktail.strIngredient15 {
                                Text("\(cocktail.strMeasure15?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail15)")
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
                
                ButtonAction(title: "Random", color: .green, action: {
                    update()
                })
                
                ButtonAction(title: "Favorite", color: .purple, action: {
                    cocktailName = cocktail.strDrink.capitalized
                    
                    cocktailThumb = "\(cocktail.strDrinkThumb)"
                    
                    if cocktail.strCategory != "Other/Unknown" {
                        cocktailDetails = cocktail.strCategory
                        cocktailDetails.append("\n" + cocktail.strAlcoholic)
                        cocktailDetails.append("\n" + cocktail.strGlass)
                    } else {
                        cocktailDetails = cocktail.strAlcoholic
                        cocktailDetails.append("\n" + cocktail.strGlass)
                    }
                    
                    if let cocktail1 = cocktail.strIngredient1 {
                        cocktailIngredients = "\(cocktail.strMeasure1?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail1)"
                    }
                    if let cocktail2 = cocktail.strIngredient2 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure2?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail2)")
                    }
                    if let cocktail3 = cocktail.strIngredient3 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure3?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail3)")
                    }
                    if let cocktail4 = cocktail.strIngredient4 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure4?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail4)")
                    }
                    if let cocktail5 = cocktail.strIngredient5 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure5?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail5)")
                    }
                    if let cocktail6 = cocktail.strIngredient6 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure6?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail6)")
                    }
                    if let cocktail7 = cocktail.strIngredient7 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure7?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail7)")
                    }
                    if let cocktail8 = cocktail.strIngredient8 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure8?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail8)")
                    }
                    if let cocktail9 = cocktail.strIngredient9 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure9?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail9)")
                    }
                    if let cocktail10 = cocktail.strIngredient10 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure10?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail10)")
                    }
                    if let cocktail11 = cocktail.strIngredient11 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure11?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail11)")
                    }
                    if let cocktail12 = cocktail.strIngredient12 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure12?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail12)")
                    }
                    if let cocktail13 = cocktail.strIngredient13 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure13?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail13)")
                    }
                    if let cocktail14 = cocktail.strIngredient14 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure14?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail14)")
                    }
                    if let cocktail15 = cocktail.strIngredient15 {
                        cocktailIngredients.append("\n\(cocktail.strMeasure15?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(cocktail15)")
                    }
                    
                    cocktailRecipe = cocktail.strInstructions.capitalized
                    
                    //                        print(cocktailName + "\n" + cocktailThumb + "\n" + cocktailDetails + "\n" + cocktailIngredients + "\n" + cocktailRecipe)
                    
                    if coreDataViewModel.savedEntities.contains(where: {$0.name == cocktailName}) {
                        buttonDisabled.toggle()
                    } else {
                        coreDataViewModel.addCocktail(
                            name: cocktailName,
                            thumb: cocktailThumb,
                            details: cocktailDetails,
                            ingredients: cocktailIngredients,
                            recipe: cocktailRecipe)
                        buttonDisabled.toggle()
                    }
                    
                }).disabled(buttonDisabled)
            }
        }.onAppear {
            randomViewModel.getCocktail(urlString: APIEndpoints.randomCocktailAPI)
        }.padding()
            .foregroundColor(textColor())
    }
    
    func update() {
        randomViewModel.getCocktail(urlString: APIEndpoints.randomCocktailAPI)
        if buttonDisabled {
            buttonDisabled.toggle()
        }
    }
    
    func textColor() -> Color {
        let scheme = colorScheme
        switch scheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .green
        }
    }
    
}

struct URLImage: View {
    let urlString: String
    
    let width: CGFloat
    let height: CGFloat
    
    let radius: CGFloat
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: width, height: height)
                .cornerRadius(radius)
                .aspectRatio(contentMode: .fill)
        } else {
            Image(uiImage: UIImage(named: "CocktailLogo")!)
                .resizable()
                .frame(width: width, height: height)
                .cornerRadius(radius)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
    
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}

struct ButtonAction: View {
    var title: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 35)
                .background(color)
                .cornerRadius(30)
                .shadow(radius: 10)
        }
        .padding(.top, 15)
        .padding(.horizontal)
    }
}
