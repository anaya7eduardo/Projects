//
//  GetACocktailApp.swift
//  GetACocktail
//
//  Created by unkn0wn on 3/28/23.
//

import SwiftUI

@main
struct GetACocktailApp: App {
    
    @State private var showMainContent = false
    
    var body: some Scene {
        WindowGroup {
            if !showMainContent {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showMainContent = true
                            }
                        }
                    }
            } else {
                MainView()
                    .transition(.opacity)
                    .onChange(of: showMainContent) { newValue in
                        withAnimation(.easeInOut(duration: 0.5)) {}
                    }
            }
        }
    }
}
