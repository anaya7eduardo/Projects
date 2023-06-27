//
//  FavoritesViewModel.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ObservableObject {
    
    func loadImage(imageURL: String, frameWidth: CGFloat, frameHeight: CGFloat, radius: CGFloat) -> some View {
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeInOut(duration: 0.7))) { phase in
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
                    Image(uiImage: UIImage(named: "cocktailLogoThumb")!)
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
