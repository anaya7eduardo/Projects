//
//  SchoolListViewModel.swift
//  20230316-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 3/16/23.
//

import Foundation
import Combine

protocol RefreshUIProtocol {
    func refreshMyUIScreen()
}

class SchoolListViewModel {
    
    var schoolList: [SchoolInfo] = [] {
        didSet {
            delegate?.refreshMyUIScreen()
        }
    }
    
    var schoolSATInfo: [SATInfo] = [] {
        didSet {
            delegate?.refreshMyUIScreen()
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    var networkManager: Networkable
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    var delegate: RefreshUIProtocol?
    
    func getSchoolList(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.networkManager.getDataFromURL(url: url, type: [SchoolInfo].self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Task is done : getSchoolList")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
        } receiveValue: { schoolsArray in
//            print(schoolsArray)
            DispatchQueue.main.async {
                self.schoolList = schoolsArray
            }
        }.store(in: &cancellable)
    }
    
    func getSchoolSATInfo(urlString: String, dbn: String) {
//        print(urlString + dbn)
        guard let url = URL(string: urlString + dbn) else { return }
        self.networkManager.getDataFromURL(url: url, type: [SATInfo].self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Task is done : getSchoolSATInfo")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
        } receiveValue: { schoolsSATArray in
//            print(schoolsSATArray)
            DispatchQueue.main.async {
                self.schoolSATInfo = schoolsSATArray
            }
        }.store(in: &cancellable)
    }
    
    func toNumbFromString(string: String) -> String {
        if let intValue = Int(string) {
            return "\(intValue)"
        } else if let doubleValue = Double(string) {
            return "\(doubleValue)"
        } else {
            return "0"
        }
    }
    
}
