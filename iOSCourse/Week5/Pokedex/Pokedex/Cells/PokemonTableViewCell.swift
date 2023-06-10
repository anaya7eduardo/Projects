//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/4/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    //MARK: -UIReferences
    @IBOutlet weak var pokemonSprintView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK: -SetupCellWithPokemonInfo
    func setupCell(_ pokemon: PokemonSelected) {
        //pokemonSprintView.getImage(from: pokemon.sprites.front_default)
        pokemonSprintView.getImage(from: pokemon.sprites.other.home.home_front)
        //pokemonSprintView.getImage(from: pokemon.sprites.other.artwork.official_front)
        
        pokemonNameLabel.text = pokemon.name.capitalized
        
        for (index, _) in (pokemon.types).enumerated() {
            if index == 0 {
                pokemonTypeLabel.text? = "Type: " + pokemon.types[0].typ.name.capitalized
            } else if index == 1 {
                pokemonTypeLabel.text? = "Types: " + pokemon.types[0].typ.name.capitalized + "/" + pokemon.types[1].typ.name.capitalized
            }
         }
        
        if pokemon.id < 10 {
            //00
            pokemonNumberLabel.text = "#\(pokemon.id)"
        } else if pokemon.id < 100 {
            //0
            pokemonNumberLabel.text = "#\(pokemon.id)"
        } else {
            //
            pokemonNumberLabel.text = "#\(pokemon.id)"
        }
        
        let alpha = 0.65
        let pokemonType = pokemon.types[0].typ.name.lowercased()
        switch pokemonType {
        case "grass":
            setupBackground(color: 0x77c943, alpha: alpha)
        case "fire":
            setupBackground(color: 0xef8120, alpha: alpha)
        case "water":
            setupBackground(color: 0x618ef3, alpha: alpha)
        case "bug":
            setupBackground(color: 0xa6ba00, alpha: alpha)
        case "normal":
            setupBackground(color: 0xa9a878, alpha: alpha)
        case "poison":
            setupBackground(color: 0xa439a3, alpha: alpha)
        case "electric":
            setupBackground(color: 0xf7d200, alpha: alpha)
        case "ground":
            setupBackground(color: 0xe2c05d, alpha: alpha)
        case "fairy":
            setupBackground(color: 0xd984ad, alpha: alpha)
        case "fighting":
            setupBackground(color: 0xc42c21, alpha: alpha)
        case "psychic":
            setupBackground(color: 0xfc5286, alpha: alpha)
        case "rock":
            setupBackground(color: 0xb6a229, alpha: alpha)
        case "ghost":
            setupBackground(color: 0x735699, alpha: alpha)
        case "ice":
            setupBackground(color: 0x94d9d6, alpha: alpha)
        case "dragon":
            setupBackground(color: 0x6f23ff, alpha: alpha)
        case "dark":
            setupBackground(color: 0x715846, alpha: alpha)
        case "steel":
            setupBackground(color: 0xb7b7cf, alpha: alpha)
        case "flying":
            setupBackground(color: 0xa98cf6, alpha: alpha)
        
        default:
            setupBackground(color: 0xFFFFFF, alpha: alpha)
        }
    }
    
    func setupBackground(color: Int, alpha: CGFloat) {
        self.backgroundColor = UIColor(rgb: color, a: alpha)
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(
        red: CGFloat(red) / 255.0,
        green: CGFloat(green) / 255.0,
        blue: CGFloat(blue) / 255.0,
        alpha: a
       )
   }

   convenience init(rgb: Int, a: CGFloat = 1.0) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF,
           a: a
       )
   }
}
