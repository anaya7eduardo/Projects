//
//  CocktailListViewModel.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/15/23.
//

import Combine
import Foundation
import SwiftUI

class CocktailListViewModel: ObservableObject {
    
    @Published var cocktailList: [Drink] = []
    @Published var cocktail: [CocktailInfo] = []
    
    var networkManager: Networkable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getCocktailByID(for id: String) {
        guard let url = APIEndpoints.cocktailByIdAPI(id: id) else { return }
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
                self.cocktail = cocktailArray.drinks
            }
        }.store(in: &cancellable)
    }
    
    func getCocktailList(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.networkManager.getDataFromURL(url: url, type: CocktailList.self)
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
    
    func loadImage(imageURL: String, frameWidth: CGFloat, frameHeight: CGFloat, radius: CGFloat) -> some View {
        AsyncImage(url: URL(string: imageURL+"/preview"), transaction: Transaction(animation: .easeInOut(duration: 0.7))) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .frame(width: frameWidth, height: frameHeight)
                
            case .failure(let error):
                Text(error.localizedDescription)
                
            case .empty:
                ZStack {
                    Image(uiImage: UIImage(named: "CocktailLogo")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                        .frame(width: frameWidth, height: frameHeight)
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
    
    func textColor(_ scheme: ColorScheme) -> Color {
        let selectedScheme = scheme
        switch selectedScheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .green
        }
    }
    
}
