//
//  FavoritedViewController.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 1/6/22.
//

import UIKit

class ShowFavViewController: UIViewController {
    var favCocktail: FavCocktail?
    
    @IBOutlet weak var strDrinkThumbFavImageView: UIImageView!
    @IBOutlet weak var strDrinkFavLabel: UILabel!
    @IBOutlet weak var strDescriptionFavLabel: UITextView!
    @IBOutlet weak var strInstructionsFavLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let data = favCocktail?.thumbFav {
            let image = UIImage(data: data)
            strDrinkThumbFavImageView.image = image
        }
        strDrinkFavLabel.text = favCocktail?.drinkFav
        strDescriptionFavLabel.text = favCocktail?.descriptionFav
        strInstructionsFavLabel.text = favCocktail?.instructionsFav
    }

}
