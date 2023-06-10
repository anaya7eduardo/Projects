//
//  CoolWeatherView.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import SwiftUI

struct CoolWeatherView: View {
    @StateObject private var viewModel = CoolWeatherViewModel()
    @State private var selectedUnit = "C"
    @State private var locationInput: String = ""
    
    var body: some View {
        VStack {
            VStack {
                if let weather = viewModel.weather {
                    Text(weather.location.name).font(.title)
                    Text("\(weather.location.region), \(weather.location.country)").font(.headline)
                    Text("Local Time: \(viewModel.formatDateString(weather.location.localtime))").font(.subheadline)
                    
                    viewModel.loadIcon(for: weather.current.condition.icon)
                    
                    Text("Condition: \(weather.current.condition.text)")
                    
                    if selectedUnit == "C" {
                        Text(String(format: "Temperature: %.1f °C", weather.current.tempC))
                        Text(String(format: "Feels like: %.1f °C", weather.current.feelslikeC))
                        Text(String(format: "Wind Speed: %.1f km/h", weather.current.windKph))
                        Text(String("Wind Direction \(weather.current.windDir)"))
                        Text(String(format: "Wind Degree: %.1f", weather.current.windDegree))
                        Text(String(format: "Pressure: %.1f mb", weather.current.pressureMB))
                        Text(String(format: "Precipitation: %.3f mm", weather.current.precipMm))
                        Text(String(format: "Visibility: %.1f km", weather.current.visKM))
                        Text(String(format: "Gust: %.1f km/h", weather.current.gustKph))
                    } else {
                        Text(String(format: "Temperature: %.1f °F", weather.current.tempF))
                        Text(String(format: "Feels like: %.1f °F", weather.current.feelslikeF))
                        Text(String(format: "Wind Speed: %.1f mph", weather.current.windMph))
                        Text(String("Wind Direction \(weather.current.windDir)"))
                        Text(String(format: "Wind Degree: %.1f", weather.current.windDegree))
                        Text(String(format: "Pressure: %.1f in", weather.current.pressureIn))
                        Text(String(format: "Precipitation: %.3f in", weather.current.precipIn))
                        Text(String(format: "Visibility: %.1f miles", weather.current.visMiles))
                        Text(String(format: "Gust: %.1f mph", weather.current.gustMph))
                    }
                    
                    Text("Last Time Updated: \(viewModel.formatDateString(weather.current.lastUpdated))").font(.subheadline)
                    
                    Picker(selection: $selectedUnit, label: Text("Temperature Unit")) {
                        Text("Celsius (°C)").tag("C")
                        Text("Fahrenheit (°F)").tag("F")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            .frame(height: 450)
            
            TextField("Enter location", text: $locationInput, onCommit: {
                viewModel.fetchWeather(for: locationInput)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button(action: {
                viewModel.fetchWeather(for: locationInput)
            }, label: {
                Text("Fetch Weather")
            })
            .buttonStyle(.borderedProminent)
            .padding()
            
        }
        .padding()
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CoolWeatherView()
    }
}
