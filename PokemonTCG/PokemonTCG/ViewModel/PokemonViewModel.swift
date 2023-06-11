//
//  PokemonViewModel.swift
//  PokemonTCG
//
//  Created by unkn0wn on 3/10/23.
//

import Foundation
import Combine
import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var customError: NetworkError?
    
    @Published var pokemonList: [PokemonData] = []
    
    var networkManager: Networkable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getPokemonList(urlString: String) {
        guard let url = URL(string: urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        self.networkManager.getDataFromURL(url: url, type: Pokemon.self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Task is done")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self.customError = NetworkError.parsingError
                }
                
            } receiveValue: { pokemonArray in
                //print(pokemonArray)
                DispatchQueue.main.async {
                    self.pokemonList = pokemonArray.data
                }
            }.store(in: &cancellable)
    }
    
    func loadImage(imageURL: String, frameWidth: CGFloat? = nil, frameHeight: CGFloat, pokemonName: String? = nil) -> some View {
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeInOut(duration: 0.7))) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .frame(width: frameWidth, height: frameHeight)
                if let pokemonName {
                    Text(pokemonName)
                        .foregroundColor(.yellow)
                        .font(.system(size: 13, weight: .semibold))
                }
                
            case .failure(let error):
                Text(error.localizedDescription)
                
            case .empty:
                VStack {
                    Text("Loading Card...")
                        .font(.system(size: 10, weight: .semibold))
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                        .frame(width: frameWidth, height: frameHeight)
                }
                
            @unknown default:
                EmptyView()
                    .frame(width: frameWidth, height: frameHeight)
            }
        }
    }
    
}
