//
//  RandomViewController.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/4/22.
//

import UIKit

class RandomViewController: UIViewController {
    let database = DatabaseHandler()
    var favCocktail: [FavCocktail]?
    
    @IBOutlet weak var strDrinkThumbImageView: UIImageView!
    @IBOutlet weak var strDrinkLabel: UILabel!
    @IBOutlet weak var strDescriptionTextView: UITextView!
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchJSON {
//            print("JSON Parsed")
        }
    }
    
    func save() {
        guard let cocktail = database.add(FavCocktail.self) else { return }
        guard let thumb = strDrinkThumbImageView.image?.pngData(), let drink = strDrinkLabel.text, let description = strDescriptionTextView.text, let instructions = strInstructionsTextView.text else { return }
        cocktail.drinkFav = drink
        cocktail.descriptionFav = description
        cocktail.thumbFav = thumb
        cocktail.instructionsFav = instructions
        
        favCocktail?.append(cocktail)
        database.save()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
//        favoriteButton.isHidden = true
//        print("\(strDrinkLabel.attributedText?.string ?? "")\n\(strDescriptionTextView.attributedText.string)\n\(strInstructionsTextView.attributedText.string)\n\nCocktail Has Been Favorited")
        save()
        //Previous
        _ = navigationController?.popViewController(animated: true)
        //Root
        //_ = navigationController?.popToRootViewController(animated: true)
    }
    
    
}
