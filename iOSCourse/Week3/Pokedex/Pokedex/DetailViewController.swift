//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    var pokemonDetails: PokemonSelected?
    
    let artworkURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    @IBOutlet weak var pokemonNameDetail: UILabel!
    @IBOutlet weak var pokemonImageDetail: UIImageView!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightTextView: UITextView!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonWeightTextView: UITextView!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonTypeTextView: UITextView!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesTextView: UITextView!
    @IBOutlet weak var pokemonMovesLabel: UILabel!
    @IBOutlet weak var pokemonMovesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillDetailLabel()
    }

    //MARK: -Functions
    func fillDetailLabel() {
        let alpha = 0.65
        let pokemonType = pokemonDetails!.types[0].typ.name.lowercased()
        switch pokemonType {
        case "normal":
            let bgColor = UIColor.lightGray.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "grass", "bug":
            let bgColor = UIColor.green.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "fire":
            let bgColor = UIColor.red.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "water","ice":
            let bgColor = UIColor.blue.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "electric":
            let bgColor = UIColor.yellow.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "poison":
            let bgColor = UIColor.magenta.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "ground", "rock":
            let bgColor = UIColor.brown.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "psychic","ghost":
            let bgColor = UIColor.purple.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "fairy":
            let bgColor = UIColor.systemPink.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "fighting":
            let bgColor = UIColor.orange.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        case "dragon":
            let bgColor = UIColor.systemTeal.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        default:
            let bgColor = UIColor.gray.withAlphaComponent(alpha)
            setupTextLabels(color: bgColor)
        }
        
        pokemonHeightTextView.isEditable = false
        pokemonWeightTextView.isEditable = false
        pokemonTypeTextView.isEditable = false
        pokemonAbilitiesTextView.isEditable = false
        pokemonMovesTextView.isEditable = false
        
        pokemonNameDetail.text = "#\((pokemonDetails?.id)!) \((pokemonDetails?.name.capitalized)!)"
        
        //pokemonImageDetail.getImage(from: (pokemonDetails?.sprites.front)!)
        pokemonImageDetail.getImage(from: (URL(string: artworkURL+"\((pokemonDetails?.id)!).png"))!)
        
        //1 m = 3.28084 ft
        pokemonHeightTextView.text = "\(Double(pokemonDetails!.height)/10.0)m"
        //1 kg = 2.20462 lbs
        pokemonWeightTextView.text = "\(Double(pokemonDetails!.weight)/10.0)kg"
        
        var t = 0
        for each in pokemonDetails!.types {
            if t < 1 {
                pokemonTypeLabel.text? = "Type:"
                pokemonTypeTextView.text? += each.typ.name.capitalized
                t += 1
            } else {
                pokemonTypeLabel.text? = "Types:"
                pokemonTypeTextView.text? += ", " + each.typ.name.capitalized
            }
        }
        
        t = 0
        for each in pokemonDetails!.abilities {
            if t < 1 {
                pokemonAbilitiesTextView.text? += each.ability.name.capitalized
                t += 1
            } else {
                pokemonAbilitiesTextView.text? += ", " + each.ability.name.capitalized
            }
        }
        
        t = 0
        for each in pokemonDetails!.moves {
            if t < 1 {
                pokemonMovesTextView.text? += each.move.name.capitalized
                t += 1
            } else {
                pokemonMovesTextView.text? += ", " + each.move.name.capitalized
            }
        }
        
    }
    
    func setupTextLabels(color: UIColor) {
        pokemonNameDetail.backgroundColor = color
        pokemonHeightLabel.backgroundColor = color
        pokemonWeightLabel.backgroundColor = color
        pokemonTypeLabel.backgroundColor = color
        pokemonAbilitiesLabel.backgroundColor = color
        pokemonMovesLabel.backgroundColor = color
    }
    
}


/*
 ### Detail Screen
     -Detail screen needs to include all the information from the cell as well as the full list of abilities and moves of the pokemon. You can give any other information you want here as well.
     -All information displayed on the detail screen needs to be visible on all devices. This is up ro the FE how they wish to tackle this issue.
 */
