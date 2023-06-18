//
//  IngredientsGridCellView.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/16/23.
//

import SwiftUI

struct IngredientsGridCellView: View {
    
    var cellData: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), center: .center))
                .overlay(Text(cellData)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black, radius: 3, x: 0, y: 2))
                .frame(width: 115, height: 115)
        }
    }
}

struct IngredientsGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsGridCellView(cellData: "Ingredient")
    }
}
