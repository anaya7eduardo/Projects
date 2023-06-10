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
        pokemonSprintView.getImage(from: pokemon.sprites.front)
        pokemonNameLabel.text = pokemon.name.capitalized
        
        for (index, item) in (pokemon.types).enumerated() {
            if index == 0 {
                pokemonTypeLabel.text? = "Type(s): " + item.typ.name.capitalized
            } else if index == 1 {
                pokemonTypeLabel.text? += "/" + item.typ.name.capitalized
            }
         }
        
        pokemonNumberLabel.text = "#\(pokemon.id)"
        
        let alpha = 0.40
        let pokemonType = pokemon.types[0].typ.name.lowercased()
        switch pokemonType {
        case "normal":
            self.backgroundColor = .lightGray.withAlphaComponent(alpha)
        case "grass", "bug":
            self.backgroundColor = .green.withAlphaComponent(alpha)
        case "fire":
            self.backgroundColor = .red.withAlphaComponent(alpha)
        case "water","ice":
            self.backgroundColor = .blue.withAlphaComponent(alpha)
        case "electric":
            self.backgroundColor = .yellow.withAlphaComponent(alpha)
        case "poison":
            self.backgroundColor = .magenta.withAlphaComponent(alpha)
        case "ground", "rock":
            self.backgroundColor = .brown.withAlphaComponent(alpha)
        case "psychic","ghost":
            self.backgroundColor = .purple.withAlphaComponent(alpha)
        case "fairy":
            self.backgroundColor = .systemPink.withAlphaComponent(alpha)
        case "fighting":
            self.backgroundColor = .orange.withAlphaComponent(alpha)
        case "dragon":
            self.backgroundColor = .systemTeal.withAlphaComponent(alpha)
        default:
            self.backgroundColor = .gray.withAlphaComponent(alpha)
        }
    }
    
}
