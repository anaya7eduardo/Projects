//
//  CoolWeatherView.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import SwiftUI

struct CoolWeatherView: View {
    @ObservedObject var viewModel: CoolWeatherViewModel
    
    @State private var locationInput: String = ""
    @State private var selectedUnit = "C"
    @State private var showWeatherData = false
    
    var body: some View {
        VStack {
            TextField("Enter location", text: $locationInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if showWeatherData {
                if !locationInput.isEmpty {
                    
                    Text(viewModel.locationName)
                        .font(.title)
                    
                    Text(viewModel.locationCountry)
                        .font(.headline)
                    
                    if viewModel.conditionIcon.contains("https:") {
                        viewModel.loadIcon(for: viewModel.conditionIcon)
                    } else {
                        viewModel.loadIcon(for: "https:"+viewModel.conditionIcon)
                    }
                    
                    Text(viewModel.conditionText)
                        .font(.headline)
                    
                    Text(viewModel.formatDateString(viewModel.localTime))
                        .font(.subheadline)
                    
                    if selectedUnit == "C" {
                        Text(String(format: "Temperature: %.1f °C", viewModel.temperatureC))
                        Text(String(format: "Wind: %.1f km/h", viewModel.windKph))
                        Text(String(format: "Pressure: %.1f mb", viewModel.pressureMB))
                        Text(String(format: "Precipitation: %.3f mm", viewModel.precipMm))
                        Text(String(format: "Feels like: %.1f °C", viewModel.feelslikeC))
                        Text(String(format: "Visibility: %.1f km", viewModel.visibilityKM))
                        Text(String(format: "Gust: %.1f km/h", viewModel.gustKph))
                    } else {
                        Text(String(format: "Temperature: %.1f °F", viewModel.temperatureF))
                        Text(String(format: "Wind: %.1f mph", viewModel.windMph))
                        Text(String(format: "Pressure: %.1f in", viewModel.pressureIn))
                        Text(String(format: "Precipitation: %.3f in", viewModel.precipIn))
                        Text(String(format: "Feels like: %.1f °F", viewModel.feelslikeF))
                        Text(String(format: "Visibility: %.1f miles", viewModel.visibilityMiles))
                        Text(String(format: "Gust: %.1f mph", viewModel.gustMph))
                    }
                    
                }
            }
            
            Picker(selection: $selectedUnit, label: Text("Unit")) {
                Text("Celsius (°C)").tag("C")
                Text("Fahrenheit (°F)").tag("F")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Fetch Weather") {
                viewModel.fetchData(for: locationInput)
                showWeatherData = true
            }
            .padding()
        }.onAppear {
            viewModel.fetchData(for: "London")
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CoolWeatherView(viewModel: CoolWeatherViewModel())
    }
}
