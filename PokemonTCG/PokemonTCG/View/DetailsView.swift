//
//  DetailsView.swift
//  PokemonTCG
//
//  Created by unkn0wn on 3/10/23.
//

import SwiftUI

struct DetailsView: View {
    
    let pokemon: PokemonData
    
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(networkManager: NetworkManager())
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, gradient()]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                // MARK: - Header
                HStack(alignment: .center){
                    Text(pokemon.name)
                        .font(.largeTitle.bold())
                        .foregroundColor(.black)
                    Spacer()
                    if let level = pokemon.level {
                        Text("  LVL: \(level)  ")
                            .font(.title2).bold()
                            .foregroundColor(.yellow)
                            .background(.black)
                    }
                    Spacer()
                    Text("  HP: \(pokemon.hp)  ")
                        .font(.title2).bold()
                        .foregroundColor(.red)
                        .background(.black)
                }.padding(5)
                
                Divider()
                
                VStack {
                    viewModel.loadImage(imageURL: pokemon.images.large, frameHeight: 250.0)
                }.frame(height: 260.0, alignment: .center).padding(5)
                
                Divider()
                
                ScrollView {
                    // MARK: - Details
                    Section {
                        VStack(alignment: .leading, spacing: 7)
                        {
                            let typeCount = pokemon.types.count
                            if typeCount > 1 {
                                Text("Types: \(pokemon.types.map{$0.rawValue}.joined(separator: ", "))")
                            } else {
                                Text("Type: \(pokemon.types[0].rawValue)")
                            }
                            
                            let subtypeCount = pokemon.subtypes.count
                            if subtypeCount > 1 {
                                Text("Subtypes: \(pokemon.subtypes.map{$0.rawValue}.joined(separator: ", "))")
                            } else {
                                Text("Subtype: \(pokemon.subtypes[0].rawValue)")
                            }
                            
                            Text("Rarity: \(pokemon.rarity?.rawValue ?? "N/A")")
                            
                            let natPokCount = pokemon.nationalPokedexNumbers.count
                            if natPokCount > 1 {
                                Text("National Pokédex Number: #\(pokemon.nationalPokedexNumbers.map{$0.description}.joined(separator: ", #"))")
                            } else {
                                Text("National Pokédex Number: #\(pokemon.nationalPokedexNumbers[0])")
                            }
                            
                            Text("Artist: \(pokemon.artist)")
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Details")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Abilities
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            if let abilities = pokemon.abilities {
                                ForEach(abilities, id: \.name) { ability in
                                    Text(ability.name)
                                        .fontWeight(.semibold)
                                    Text(ability.text)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            } else {
                                Text("N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Abilities")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Attacks
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            if let attacks = pokemon.attacks {
                                ForEach(attacks, id: \.name) { attack in
                                    if !attack.damage.isEmpty {
                                        Text(attack.name + "   DMG: " + attack.damage)
                                            .fontWeight(.semibold)
                                    } else {
                                        Text(attack.name)
                                            .fontWeight(.semibold)
                                    }
                                    Text(attack.text)
                                        .font(.system(size: 16.0, weight: .medium))
                                }
                            } else {
                                Text("N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Attacks")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Weaknesses
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            if let weaknesses = pokemon.weaknesses {
                                ForEach(weaknesses, id: \.value) { weakness in
                                    Text("\(weakness.type.rawValue)  \(weakness.value)")
                                }
                            } else {
                                Text("N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Weakness")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Resistances
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            if let resistances = pokemon.resistances {
                                ForEach(resistances, id: \.value) { resistance in
                                    Text("\(resistance.type.rawValue)  \(resistance.value)")
                                }
                            } else {
                                Text("N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Resistance")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Evolutions
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            if let evolvesFrom = pokemon.evolvesFrom {
                                Text("Evolves From: \(evolvesFrom)")
                                    .font(.system(size: 16.0, weight: .medium))
                            } else {
                                Text("Evolves From: N/A")
                            }
                            
                            if let evolvesTo = pokemon.evolvesTo {
                                Text("Evolves To: \(evolvesTo[0])")
                                    .font(.system(size: 16.0, weight: .medium))
                            } else {
                                Text("Evolves To: N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Evolutions")
                            .font(.headline)
                            .padding(5)
                    }
                    
                    // MARK: - Rules
                    Section {
                        VStack {
                            if let rules = pokemon.rules {
                                Text("\(rules[0])")
                                    .font(.system(size: 16.0, weight: .medium))
                            } else {
                                Text("N/A")
                            }
                        }.frame(minWidth: 350, alignment: .leading)
                    } header: {
                        Text("Rules")
                            .font(.headline)
                            .padding(5)
                    }
                    
                }.padding(5).foregroundColor(textColor())
            }
        }
    }
    
    func gradient() -> Color {
        let type = pokemon.types[0]
        switch type {
        case .colorless:
            return .white
        case .darkness:
            return .gray
        case .dragon:
            return .indigo
        case .fighting:
            return .orange
        case .fire:
            return .red
        case .grass:
            return .green
        case .lightning:
            return .yellow
        case .metal:
            return .brown
        case .psychic:
            return .purple
        case .water:
            return .blue
        }
    }
    
    func textColor() -> Color {
        let type = pokemon.types[0]
        switch type {
        case .colorless:
            return .black
        default:
            return .white
        }
    }
    
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
