//
//  ContentView.swift
//  PokemonTCG
//
//  Created by unkn0wn on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(networkManager: NetworkManager())
    
    @State private var searchText = ""
    
    var allPokemon: [PokemonData] {
        searchText.isEmpty ? viewModel.pokemonList.sorted{ $0.id < $1.id } : viewModel.pokemonList.filter{ $0.name.contains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(allPokemon) { pokemon in
                            NavigationLink {
                                DetailsView(pokemon: pokemon)
                            } label: {
                                VStack {
                                    viewModel.loadImage(imageURL: pokemon.images.small, frameWidth: 100.0, frameHeight: 150.0, pokemonName: pokemon.name)
                                }.padding()
                            }
                        }
                    }
                }.refreshable { viewModel.getPokemonList(urlString: APIEndpoints.PokemonListEndpoint) }
                    .searchable(text: $searchText)
                    .navigationTitle("Pokémon TCG")
                
            }.onAppear { viewModel.getPokemonList(urlString: APIEndpoints.PokemonListEndpoint) }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
