//
//  MainView.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(uiImage: UIImage(named: "backgroundHome")!)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: RandomView()) {
                        ZStack {
                            Image(uiImage: UIImage(named: "randomCocktail")!)
                                .resizable()
                            VStack {
                                Spacer()
                                Text("Random")
                                    .foregroundColor(textColor())
                                    .font(.system(size: 30.0, weight: .semibold))
                            }
                        }
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(15.0)
                        .shadow(color: .teal, radius: 10.0, x: 10.0, y: 10.0)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: FavoritesView()) {
                        ZStack {
                            Image(uiImage: UIImage(named: "favoriteCocktail")!)
                                .resizable()
                            VStack {
                                Spacer()
                                Text("Favorites")
                                    .foregroundColor(textColor())
                                    .font(.system(size: 30.0, weight: .semibold))
                            }
                        }
                        .frame(width: 150.0, height: 150.0)
                        .cornerRadius(15.0)
                        .shadow(color: .purple, radius: 10.0, x: 10.0, y: 10.0)
                    }
                    
                    Spacer()
                    Spacer()
                }.padding()
            }
        }
    }
    
    func textColor() -> Color {
        let scheme = colorScheme
        switch scheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .green
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
