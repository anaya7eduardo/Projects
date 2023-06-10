//
//  MainPage.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 3/7/23.
//

import SwiftUI

struct MainPage: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: MyPage.home)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page: page)
                }.sheet(item: $coordinator.mySheet) { sheet in
                    coordinator.getSheet(sheet: sheet)
                }
        }
    }
    
}

struct MainPage_Previews: PreviewProvider {
    
    static var previews: some View {
        MainPage()
            .environmentObject(Coordinator())
            .environmentObject(UserInfo())
    }
    
}
