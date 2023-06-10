//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    var pokemonDetails: PokemonSelected!
    var isActive: Bool = false
    
    @IBOutlet weak var pokemonNameDetail: UILabel!
    @IBOutlet weak var pokemonSparkles: UIImageView!
    @IBOutlet weak var pokemonImageDetail: UIImageView!
    @IBOutlet weak var pokemonImageButton: UIButton!
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
        pokemonSparkles.isHidden = true
        let alpha = 0.85
        let pokemonType = pokemonDetails.types[0].typ.name.lowercased()
        switch pokemonType {
        case "grass":
            setupTextLabels(color: 0x77c943, alpha: alpha)
        case "fire":
            setupTextLabels(color: 0xef8120, alpha: alpha)
        case "water":
            setupTextLabels(color: 0x618ef3, alpha: alpha)
        case "bug":
            setupTextLabels(color: 0xa6ba00, alpha: alpha)
        case "normal":
            setupTextLabels(color: 0xa9a878, alpha: alpha)
        case "poison":
            setupTextLabels(color: 0xa439a3, alpha: alpha)
        case "electric":
            setupTextLabels(color: 0xf7d200, alpha: alpha)
        case "ground":
            setupTextLabels(color: 0xe2c05d, alpha: alpha)
        case "fairy":
            setupTextLabels(color: 0xd984ad, alpha: alpha)
        case "fighting":
            setupTextLabels(color: 0xc42c21, alpha: alpha)
        case "psychic":
            setupTextLabels(color: 0xfc5286, alpha: alpha)
        case "rock":
            setupTextLabels(color: 0xb6a229, alpha: alpha)
        case "ghost":
            setupTextLabels(color: 0x735699, alpha: alpha)
        case "ice":
            setupTextLabels(color: 0x94d9d6, alpha: alpha)
        case "dragon":
            setupTextLabels(color: 0x6f23ff, alpha: alpha)
        case "dark":
            setupTextLabels(color: 0x715846, alpha: alpha)
        case "steel":
            setupTextLabels(color: 0xb7b7cf, alpha: alpha)
        case "flying":
            setupTextLabels(color: 0xa98cf6, alpha: alpha)
        
        default:
            setupTextLabels(color: 0xFFFFFF, alpha: alpha)
        }
        
        if pokemonDetails.id < 10 {
            //00
            pokemonNameDetail.text = "No.00\(pokemonDetails.id)   \(pokemonDetails.name.capitalized)"
        } else if pokemonDetails.id < 100 {
            //0
            pokemonNameDetail.text = "No.0\(pokemonDetails.id)   \(pokemonDetails.name.capitalized)"
        } else {
            //
            pokemonNameDetail.text = "No.\(pokemonDetails.id)   \(pokemonDetails.name.capitalized)"
        }
        
        //pokemonImageDetail.getImage(from: pokemonDetails.sprites.front_default)
        pokemonImageDetail.getImage(from: pokemonDetails.sprites.other.home.home_front)
        //pokemonImageDetail.getImage(from: pokemonDetails.sprites.official_artwork.artwork.official_front)
        
        let pokeHeight = Double(pokemonDetails.height)
     
        let inch = (Double(String(format: "%.1f", pokeHeight*0.1)))!*39.3701 / 12
        let inchDec = Double(String(format: "%.4f", inch.truncatingRemainder(dividingBy: 1)))
        let integerPart = String(format: "%.2f", inch)
        let ftinchDec = String(format: "%.2f", ((inchDec!*12)/100).truncatingRemainder(dividingBy: 1))

        let startLeft = integerPart.index(integerPart.startIndex, offsetBy: 0)
        let endLeft = integerPart.index(integerPart.endIndex, offsetBy: -3)
        let rangeLeft = startLeft..<endLeft
        let mySubstringLeft = integerPart[rangeLeft]

        let startRight = ftinchDec.index(ftinchDec.startIndex, offsetBy: 2)
        let endRight = ftinchDec.index(ftinchDec.endIndex, offsetBy: 0)
        let rangeRight = startRight..<endRight
        var mySubstringRight = ftinchDec[rangeRight]
        
        let someOpt: Int? = nil
        let defVal = Int(mySubstringLeft)
        
        var mSLInt = someOpt ?? defVal!
        
        if mySubstringRight.contains("12") {
            mSLInt += 1
            mySubstringRight = "00"
        }
        
        pokemonHeightTextView.text = ("\(mSLInt)'\(mySubstringRight)'' ft")
        //1 m = 3.28084 ft
        //pokemonHeightTextView.text = "\(Double(pokemonDetails!.height)/10.0)m"
        
        let pokeWeight = Double(pokemonDetails.weight)
        
        let k: Double = pokeWeight/10.0
        
        let lb = k*2.20462
        
        let integerPartW = String(format: "%.1f", lb)
        pokemonWeightTextView.text = ("\(integerPartW) lbs")
        //1 kg = 2.20462 lbs
        //pokemonWeightTextView.text = "\(Double(pokemonDetails!.weight)/10.0)kg"
        
        var t = 0
        for each in pokemonDetails.types {
            if t < 1 {
                pokemonTypeLabel.text? = "  Type:"
                pokemonTypeTextView.text? += each.typ.name.capitalized
                t += 1
            } else {
                pokemonTypeLabel.text? = "  Types:"
                pokemonTypeTextView.text? += ", " + each.typ.name.capitalized
            }
        }
        
        t = 0
        for each in pokemonDetails.abilities {
            if t < 1 {
                pokemonAbilitiesTextView.text? += each.ability.name.capitalized
                t += 1
            } else {
                pokemonAbilitiesTextView.text? += ", " + each.ability.name.capitalized
            }
        }
        
        t = 0
        for each in pokemonDetails.moves {
            if t < 1 {
                pokemonMovesTextView.text? += each.move.name.capitalized
                t += 1
            } else {
                pokemonMovesTextView.text? += ", " + each.move.name.capitalized
            }
        }
        
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        if isActive {
            isActive = false
            //pokemonImageDetail.getImage(from: pokemonDetails.sprites.front_default)
            pokemonImageDetail.getImage(from: pokemonDetails.sprites.other.home.home_front)
            pokemonSparkles.isHidden = true
        } else {
            isActive = true
            //pokemonImageDetail.getImage(from: pokemonDetails.sprites.front_shiny)
            pokemonImageDetail.getImage(from: pokemonDetails.sprites.other.home.home_shiny)
            pokemonSparkles.isHidden = false
        }
    }
    
    
    func setupTextLabels(color: Int, alpha: CGFloat) {
        let radius:CGFloat = 15.0
        pokemonNameDetail.layer.masksToBounds = true
        pokemonNameDetail.layer.cornerRadius = radius
        pokemonHeightLabel.layer.masksToBounds = true
        pokemonHeightLabel.layer.cornerRadius = radius
        pokemonWeightLabel.layer.masksToBounds = true
        pokemonWeightLabel.layer.cornerRadius = radius
        pokemonTypeLabel.layer.masksToBounds = true
        pokemonTypeLabel.layer.cornerRadius = radius
        pokemonAbilitiesLabel.layer.masksToBounds = true
        pokemonAbilitiesLabel.layer.cornerRadius = radius
        pokemonMovesLabel.layer.masksToBounds = true
        pokemonMovesLabel.layer.cornerRadius = radius
        
//        pokemonNameDetail.textColor = UIColor.black
//        pokemonNameDetail.shadowColor = UIColor.white
//        pokemonHeightLabel.textColor = UIColor.black
//        pokemonHeightLabel.shadowColor = UIColor.white
//        pokemonWeightLabel.textColor = UIColor.black
//        pokemonWeightLabel.shadowColor = UIColor.white
//        pokemonTypeLabel.textColor = UIColor.black
//        pokemonTypeLabel.shadowColor = UIColor.white
//        pokemonAbilitiesLabel.textColor = UIColor.black
//        pokemonAbilitiesLabel.shadowColor = UIColor.white
//        pokemonMovesLabel.textColor = UIColor.black
//        pokemonMovesLabel.shadowColor = UIColor.white
        
        pokemonNameDetail.backgroundColor = UIColor(rgb: color, a: alpha)
        pokemonHeightLabel.backgroundColor = UIColor(rgb: color, a: alpha)
        pokemonWeightLabel.backgroundColor = UIColor(rgb: color, a: alpha)
        pokemonTypeLabel.backgroundColor = UIColor(rgb: color, a: alpha)
        pokemonAbilitiesLabel.backgroundColor = UIColor(rgb: color, a: alpha)
        pokemonMovesLabel.backgroundColor = UIColor(rgb: color, a: alpha)
        
        pokemonHeightTextView.isEditable = false
        pokemonWeightTextView.isEditable = false
        pokemonTypeTextView.isEditable = false
        pokemonAbilitiesTextView.isEditable = false
        pokemonMovesTextView.isEditable = false
    }
    
}
