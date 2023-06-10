//
//  APIEndpoints.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import Foundation

struct APIEndpoints {
    static let baseURL = "https://api.weatherapi.com/v1/current.json?"
    static let apiKey = "9745357b64764a1c926173930223105"

    static func currentWeatherURL(city: String) -> URL? {
        let urlString = "\(baseURL)key=\(apiKey)&q=\(city)&aqi=no"
        return URL(string: urlString)
    }
}
