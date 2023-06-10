//
//  RandomViewModel.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import Combine
import Foundation
import SwiftUI

class RandomViewModel: ObservableObject {
    
    @Published var cocktailList: [CocktailInfo] = []
    
    var networkManager: Networkable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getCocktail(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.networkManager.getDataFromURL(url: url, type: Cocktail.self)
            .sink { completion in
                switch completion {
                case .finished:
                    //print("Task is done")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            
        } receiveValue: { cocktailArray in
            //print(cocktailArray)
            DispatchQueue.main.async {
                self.cocktailList = cocktailArray.drinks
            }
        }.store(in: &cancellable)
    }
    
}
