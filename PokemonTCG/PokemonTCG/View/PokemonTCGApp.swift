//
//  PokemonTCGApp.swift
//  PokemonTCG
//
//  Created by unkn0wn on 3/10/23.
//

import SwiftUI

@main
struct PokemonTCGApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/*
 Create a Project in SwiftUI Kit Use Combine and cover the below screens.
 Use this API= https://api.pokemontcg.io/v2/cards?page=1&pageSize=50
 Screen 1 - Display Grid of Pokemon showing Image and name
 Screen 2 - Details screen: show all the Pokemon Details in different section in list details
 Use Combine in SwiftUI, new implementation of API call in viewmodel api functions/network manager  to use Combine
 1.Pull to Refresh
 2. Error handling
 3. The caching mechanism for images
 4.Search bar at top- to search Pokemon by name

 Attaching the video for reference of what Kind of UI you can implement,
 Instead of List, you can show grid on first screen.
 */
