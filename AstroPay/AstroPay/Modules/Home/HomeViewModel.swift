//
//  HomeViewModel.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import Foundation


final class HomeViewModel {
    func getAccountDetails() -> Account {
        return Account.getMockAccountDetails()
    }
}
