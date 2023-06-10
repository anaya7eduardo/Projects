//
//  ListCell.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/22/23.
//

import SwiftUI

struct ListCell: View {
    
    let cellTitle: String
    let imageURL: String
    var body: some View {
        HStack {
//            Image(systemName: "pencil.and.outline")
//                .resizable()
//                .frame(width: 20, height: 20)
//                .padding()
            AsyncImage(url: URL(string: imageURL)) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                Text("Loading")
                ProgressView()
            }.frame(width: 40, height: 40)
            Text(cellTitle)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(cellTitle: "Cell Name", imageURL: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-iphone-12-pro-max-gold-2020?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1635202937000")
    }
}
