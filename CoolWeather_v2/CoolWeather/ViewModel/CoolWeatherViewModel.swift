//
//  CoolWeatherViewModel.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import Combine
import Foundation
import SwiftUI

class CoolWeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    private var cancellable = Set<AnyCancellable>()
    private let networkManager: Networkable

    init(networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchWeather(for city: String) {
        var cityName = city
        if cityName.isEmpty {
            cityName = "London"
        }
        
        guard let url = APIEndpoints.currentWeatherURL(city: cityName) else {
            return
        }

        networkManager.getDataFromURL(url: url, type: Weather.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] weather in
                self?.weather = weather
            }
            .store(in: &cancellable)
    }
    
    func loadIcon(for imageURL: String) -> some View {
        AsyncImage(url: URL(string: formatIconURL(imageURL)), transaction: Transaction(animation: .easeInOut(duration: 0.7))) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .frame(width: 64.0, height: 64.0)
                
            case .failure(let error):
                Text(error.localizedDescription)
                
            case .empty:
                VStack {
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .indigo)).frame(width: 64.0, height: 64.0)
                    //Text("Loading Icon...")
                }
                
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func formatIconURL(_ iconURL: String) -> String {
        if iconURL.contains("https:") {
            return iconURL
        } else {
            return "https:\(iconURL)"
        }
    }
    
    func formatDateString(_ dateString: String) -> String {
        let components = dateString.split(separator: " ")
        
        // Extract the required components
        let dateComponent = components[0]
        let timeComponent = components[1]
        
        // Reformat the date component
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: String(dateComponent))
        dateFormatter.dateFormat = "MM-dd-yy"
        let reformattedDateComponent = dateFormatter.string(from: date!).replacingOccurrences(of: "-", with: "/")
        
        // Rearrange the components to form the output string
        return "\(reformattedDateComponent) \(timeComponent)"
    }
    
}
