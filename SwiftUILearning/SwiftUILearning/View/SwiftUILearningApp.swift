//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/21/23.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    
    @State var emailID: String = ""
    @State var password: String = ""
    
    var body: some Scene {
        WindowGroup {
//            ContentView(emailID: $emailID, password: $password).environmentObject(UserInfo())
            MainPage()
                .environmentObject(Coordinator())
                .environmentObject(UserInfo())
        }
    }
}

class UserInfo: ObservableObject {
    @Published var userName: String = "SwiftUI"
}
