//
//  UserViewModel.swift
//  CombineExample
//
//  Created by unkn0wn on 3/8/23.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var usersList: [User] = []
    
    var networkManager: Networkable
    
    private var cancellable = Set<AnyCancellable>()
    
    init(networkManager: Networkable) {
//        simpleUseOfCombine()
        self.networkManager = networkManager
    }
    
    func getUsersList(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.networkManager.getDataFromURL(url: url, type: [User].self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Task is done")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            
        } receiveValue: { usersArray in
            print(usersArray)
            DispatchQueue.main.async {
                self.usersList = usersArray
            }
        }.store(in: &cancellable)
    }
    
//    func simpleUseOfCombine() {
//        let numbers = [1,2,3,4,5,6,7].publisher
//        let squaredNumbers = numbers.map { $0 * $0 }
//
//        let mySubscriber = squaredNumbers.sink { value in
//            print(value)
//        }
//    }
    
}
