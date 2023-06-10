//
//  EmployeeViewModel.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/22/23.
//

import Foundation

protocol RefreshUIProtocol {
    func refreshMyUIScreen()
}

@MainActor
class EmployeeViewModel {
    var employeeList:[Employee] = [] {
        didSet {
//            refreshUI?()
            delegate?.refreshMyUIScreen()
        }
    }
    
//    var refreshUI: (()->())?
    
    var delegate: RefreshUIProtocol?
    
    func getEmployeeList(urlString:String) {
        Task {
            let networkManager = NetworkManager()
            guard let url = URL(string: urlString) else { return }
            do {
                let apiData = try await networkManager.getDataFromURL(url: url)
                let parsedData = try JSONDecoder().decode([Employee].self, from: apiData)
//                print(parsedData)
                employeeList = parsedData
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
