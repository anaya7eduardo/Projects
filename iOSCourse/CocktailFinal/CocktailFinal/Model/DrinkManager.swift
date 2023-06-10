//
//  NetworkCall.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/5/22.
//

import UIKit

extension RandomViewController {
    func fetchJSON(completed: @escaping ()->()) {
        guard let url = URL(string: APIEndpoint.randomCocktailAPI) else { return }
        let session = URLSession.shared
        
        let task =  session.dataTask(with: url) { data, response, error in
            guard data != nil else {
                print("Error: We Have No Data Bub")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Error")
                return
            }
            
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something Happened Here")")
                return
            }
            
            do {
                let drink = try JSONDecoder().decode(DrinksModel.self, from: data!)
                //self.drink = drink.drinks
                DispatchQueue.main.async { [self] in
                    completed()
                    
                    let myDrink = drink.drinks[0]
                    //let myDrink = self.drink[0]
                    
                    strDrinkThumbImageView.getImage(from: myDrink.strDrinkThumb)
                    strDrinkLabel.text = myDrink.strDrink
                    
                    if myDrink.strCategory == "Other/Unknown" {
                        strDescriptionTextView.text = "\(myDrink.strAlcoholic)\n"
                        strDescriptionTextView.text += myDrink.strGlass
                    } else {
                        strDescriptionTextView.text = "\(myDrink.strCategory)\n"
                        strDescriptionTextView.text += "\(myDrink.strAlcoholic)\n"
                        strDescriptionTextView.text += myDrink.strGlass
                    }
                    if myDrink.strIngredient1 != nil {
                        strInstructionsTextView.text = "\(myDrink.strMeasure1?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient1?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient2 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure2?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient2?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient3 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure3?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient3?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient4 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure4?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient4?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient5 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure5?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient5?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient6 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure6?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient6?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient7 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure7?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient7?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient8 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure8?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient8?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient9 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure9?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient9?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient10 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure10?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient10?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient11 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure11?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient11?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient12 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure12?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient12?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient13 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure13?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient13?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient14 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure14?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient14?.capitalized ?? "")"
                    }
                    if myDrink.strIngredient15 != nil {
                        strInstructionsTextView.text += "\n\(myDrink.strMeasure15?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) ?? "") \(myDrink.strIngredient15?.capitalized ?? "")"
                    }
                    
                    strInstructionsTextView.text += "\n\n\(myDrink.strInstructions.capitalized)"
                    
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
}
