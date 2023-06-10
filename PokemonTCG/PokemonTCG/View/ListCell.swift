//
//  ListCell.swift
//  PokemonTCG
//
//  Created by unkn0wn on 3/10/23.
//

import SwiftUI

struct ListCell: View {
    
    let cellTitle: String
    
    var body: some View {
        HStack {
            Text(cellTitle)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(cellTitle: "Cell Name")
    }
}
