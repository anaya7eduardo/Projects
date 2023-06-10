//
//  CoolWeatherApp.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import SwiftUI

@main
struct CoolWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            CoolWeatherView(viewModel: CoolWeatherViewModel())
        }
    }
}
