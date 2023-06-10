//
//  EmployeeViewModel.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/23/23.
//

import Foundation

@MainActor
class EmployeeViewModel: ObservableObject {
    @Published var employeeList: [Employee] = []
    @Published var customError: NetworkError?
    
    let networkable: Networkable
    
    init(networkable: Networkable) {
        self.networkable = networkable
    }
    
    func getEmployeeList(urlString: String) async {
        do {
            guard let url = URL(string: urlString) else {
                customError = NetworkError.invalidURL
//                throw NetworkError.invalidURL
                return
            }
            let data = try await networkable.getDataFromURL(url: url)
            let parsedResults = try JSONDecoder().decode([Employee].self, from: data)
//            DispatchQueue.main.async {
                self.employeeList = parsedResults
//                print(parsedResults)
//            }
        } catch let error {
            print(error.localizedDescription)
            customError = NetworkError.parsingError
//            throw NetworkError.parsingError
        }
    }
}
