//
//  DetailsScreen.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/22/23.
//

import SwiftUI

struct DetailsScreen: View {
    
    let detailTitle:String
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Text(detailTitle).padding(50)
        
        Text(userInfo.userName)
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(detailTitle: "Title")
    }
}
