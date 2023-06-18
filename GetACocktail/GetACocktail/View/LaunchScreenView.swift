//
//  LaunchScreenView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/17/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "backgroundApp")!)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Text("Get\n\t\tA\n\t\t Cocktail!")
                .font(.custom("Zapfino", size: 35))
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
