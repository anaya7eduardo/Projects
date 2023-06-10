//
//  ViewController.swift
//  CocktailFinal
//
//  Created by Eduardo Anaya on 12/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        setupButtonBackground(widthV: 1.0, heightV: 3.0, opacityV: 0.75, radiusV: 0.5)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: -Functions
    @IBAction func randomTapped(_ sender: Any) {
//        print("Random Pressed")
        if let rvc = storyboard?.instantiateViewController(withIdentifier: "RandomViewController") as? RandomViewController {
            self.navigationController?.pushViewController(rvc, animated: true)
        }
    }
    
    /*
     if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
         vc.pokemonDetails = pokemonDetails[(tableView.indexPathForSelectedRow?.row)!]
         self.navigationController?.pushViewController(vc, animated: true)
     }
     */
    
    @IBAction func favoriteTapped(_ sender: Any) {
//        print("Favorite Pressed")
        if let fvc = storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController {
            self.navigationController?.pushViewController(fvc, animated: true)
        }
    }
    
    func setupButtonBackground(widthV: CGFloat, heightV: CGFloat, opacityV: Float, radiusV: CGFloat) {
        randomButton.layer.shadowColor = UIColor.black.cgColor
        randomButton.layer.shadowOffset = CGSize(width: widthV, height: heightV)
        randomButton.layer.shadowOpacity = opacityV
        randomButton.layer.shadowRadius = radiusV
        randomButton.layer.masksToBounds = false
        
        favoriteButton.layer.shadowColor = UIColor.black.cgColor
        favoriteButton.layer.shadowOffset = CGSize(width: widthV, height: heightV)
        favoriteButton.layer.shadowOpacity = opacityV
        favoriteButton.layer.shadowRadius = radiusV
        favoriteButton.layer.masksToBounds = false
    }

}

