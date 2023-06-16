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
