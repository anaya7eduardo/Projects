//
//  TestUIView.swift
//  GetACocktail
//
//  Created by unkn0wn on 4/4/23.
//

import SwiftUI

struct TestUIView: View {
    var body: some View {
        Image(uiImage: UIImage(named: "backgroundHome")!)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

struct TestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestUIView()
    }
}
