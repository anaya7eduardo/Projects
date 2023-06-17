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
    
    @Published var cocktailRandom: [CocktailInfo] = []
    
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
                self.cocktailRandom = cocktailArray.drinks
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
                    Image(uiImage: UIImage(named: "cocktailLogo")!)
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

    func formatText(_ string1: String?, _ string2: String) -> String {
        guard let string1 = string1 else { return "" }
        return string1.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)+" "+string2
    }
    
    func textSize(for text: String) -> CGFloat {
        let wordCount = text.count
        
        let extraSmallSizeRange = 1...9
        let smallSizeRange = 10...19
        let mediumSizeRange = 20...24
        let largeSizeRange = 25...31
        
        if extraSmallSizeRange.contains(wordCount) {
            return 40
        } else if smallSizeRange.contains(wordCount) {
            return 34
        } else if mediumSizeRange.contains(wordCount) {
            return 30
        } else if largeSizeRange.contains(wordCount) {
            return 24
        } else {
            return 16
        }
    }
    
}
