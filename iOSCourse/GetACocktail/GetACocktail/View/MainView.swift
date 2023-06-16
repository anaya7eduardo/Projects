//
//  MainView.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainViewModel = MainViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(uiImage: UIImage(named: "backgroundHome")!)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    
                    NavigationLinkLogo(destination: CocktailListView(), image: "CocktailLogo", title: "List", textColor: mainViewModel.textColor(colorScheme), radius: 75.0, shadow: .purple)
                    
                    
                    Spacer()
                    
                    NavigationLinkLogo(destination: RandomView(), image: "randomCocktail", title: "Random", textColor: mainViewModel.textColor(colorScheme), radius: 15.0, shadow: .teal)
                    
                    Spacer()
                    
                    NavigationLinkLogo(destination: FavoritesView(), image: "favoriteCocktail", title: "Favorites", textColor: mainViewModel.textColor(colorScheme), radius: 15.0, shadow: .yellow)
                    
                    Spacer()
                }.padding()
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct NavigationLinkLogo<Destination: View>: View {
    var destination: Destination
    var image: String
    var title: String
    var textColor: Color
    var radius: CGFloat
    var shadow: Color
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Image(uiImage: UIImage(named: image)!)
                    .resizable()
                VStack {
                    Spacer()
                    Text(title)
                        .foregroundColor(textColor)
                        .font(.system(size: 30.0, weight: .semibold))
                }
            }
            .frame(width: 150.0, height: 150.0)
            .cornerRadius(radius)
            .shadow(color: shadow, radius: 10.0, x: 10.0, y: 10.0)
        }
    }
}
