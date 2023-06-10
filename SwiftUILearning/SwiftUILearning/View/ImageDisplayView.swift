//
//  ImageDisplayView.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/23/23.
//

import SwiftUI

struct ImageDisplayView: View {
    var body: some View {
        VStack {
            Image(systemName: "arrowshape.turn.up.backward.badge.clock.rtl")
                .resizable()
                .frame(width: 50, height: 50)
            
//            Divider()
//            Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            
//            Divider()
//            Button("Button") {
//
//            }
            
//            Divider()
//            Image("promax")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .frame(height: 150)
//                .frame(maxWidth: .infinity)
            
            Divider()
            AsyncImage(url: URL(string: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-iphone-12-pro-max-gold-2020?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1635202937000")) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                Text("Loading")
                ProgressView()
            }
        }
    }
}

struct ImageDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDisplayView()
    }
}
