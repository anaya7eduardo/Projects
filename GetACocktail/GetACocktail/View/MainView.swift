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
                    NavigationLinkLogo(destination: CocktailListView(), image: "cocktailThumb", title: "List", textColor: mainViewModel.textColor(colorScheme), textShadow: mainViewModel.shadowColor(colorScheme), shadow: .white)
                    
                    NavigationLinkLogo(destination: IngredientsGridView(), image: "bottlesThumb", title: "Ingredients", textColor: mainViewModel.textColor(colorScheme), textShadow: mainViewModel.shadowColor(colorScheme), shadow: .purple)
                    
                    NavigationLinkLogo(destination: RandomView(), image: "randomThumb", title: "Random", textColor: mainViewModel.textColor(colorScheme), textShadow: mainViewModel.shadowColor(colorScheme), shadow: .teal)
                    
                    NavigationLinkLogo(destination: FavoritesView(), image: "favoriteThumb", title: "Favorites", textColor: mainViewModel.textColor(colorScheme), textShadow: mainViewModel.shadowColor(colorScheme), shadow: .yellow)
                }.padding()
            }
        }
    }
    
}

struct NavigationLinkLogo<Destination: View>: View {
    var destination: Destination
    var image: String
    var title: String
    var textColor: Color
    var textShadow: Color
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
                        .shadow(color: textShadow, radius: 3.0, x: 3.0, y: 3.0)
                }
            }
            .frame(width: 165.0, height: 165.0)
            .cornerRadius(15.0)
            .shadow(color: shadow, radius: 10.0, x: 10.0, y: 10.0)
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
