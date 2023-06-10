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
    
    @Published var conditionIcon: String = ""
    @Published var locationName: String = ""
    @Published var locationCountry: String = ""
    @Published var conditionText: String = ""
    @Published var localTime: String = ""
    @Published var temperatureC: Double = 0.0
    @Published var temperatureF: Double = 0.0
    @Published var windKph: Double = 0.0
    @Published var windMph: Double = 0.0
    @Published var pressureMB: Double = 0.0
    @Published var pressureIn: Double = 0.0
    @Published var precipMm: Double = 0.0
    @Published var precipIn: Double = 0.0
    @Published var feelslikeC: Double = 0.0
    @Published var feelslikeF: Double = 0.0
    @Published var visibilityKM: Double = 0.0
    @Published var visibilityMiles: Double = 0.0
    @Published var gustKph: Double = 0.0
    @Published var gustMph: Double = 0.0
    
    private var cancellable = Set<AnyCancellable>()
    private let networkManager: Networkable
    
    init(networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData(for city: String) {
        guard let url = APIEndpoints.currentWeatherURL(cityOrCountry: city) else {
            return
        }
        
        networkManager.getDataFromURL(url: url, type: Weather.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.handleError(error)
                }
            }, receiveValue: { [weak self] weatherModel in
                self?.updateWeatherData(with: weatherModel)
            })
            .store(in: &cancellable)
    }
    
    func loadIcon(for imageURL: String) -> some View {
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeInOut(duration: 0.7))) { phase in
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
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                    //Text("Loading Icon...")
                }
                
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func formatDateString(_ dateString: String) -> String {
        let components = dateString.split(separator: " ")

        // Extract the required components
        let timeComponent = components[1]
        let dateComponent = components[0]

        // Reformat the date component
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: String(dateComponent))
        dateFormatter.dateFormat = "MM-dd-yy"
        let reformattedDateComponent = dateFormatter.string(from: date!)

        // Rearrange the components to form the output string
        return "Localtime: \(reformattedDateComponent) \(timeComponent)"
    }
    
    private func updateWeatherData(with weatherModel: Weather) {
        conditionIcon = weatherModel.current.condition.icon
        locationName = weatherModel.location.name
        locationCountry = weatherModel.location.country
        conditionText = weatherModel.current.condition.text
        localTime = weatherModel.location.localtime
        temperatureC = weatherModel.current.tempC
        temperatureF = weatherModel.current.tempF
        windKph = weatherModel.current.windKph
        windMph = weatherModel.current.windMph
        pressureMB = weatherModel.current.pressureMB
        pressureIn = weatherModel.current.pressureIn
        precipMm = weatherModel.current.precipMm
        precipIn = weatherModel.current.precipIn
        feelslikeC = weatherModel.current.feelslikeC
        feelslikeF = weatherModel.current.feelslikeF
        visibilityKM = weatherModel.current.visKM
        visibilityMiles = weatherModel.current.visMiles
        gustKph = weatherModel.current.gustKph
        gustMph = weatherModel.current.gustMph
    }
    
    private func handleError(_ error: Error) {
        print("Error fetching weather data: \(error.localizedDescription)")
    }
}
