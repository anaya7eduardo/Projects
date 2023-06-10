//
//  Account.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import Foundation

struct Account {
    let accountNumber: String
    let balance: Double
    let transactionHistory: [Transaction]
}

struct Transaction {
    let amount: Double
    let transactionDate: String
    let type: TransactionType
}

enum TransactionType: String {
    case deposit = "Deposit"
    case withdrawal = "Withdrawal"
}

extension Account {
    static func getMockAccountDetails() -> Account {
        let t1 = Transaction(amount:100.0, transactionDate: "02-21-2023, 06:44", type: .withdrawal)
        
        let t2 = Transaction(amount:300.0, transactionDate: "02-20-2023, 16:44", type: .withdrawal)
        
        let t3 = Transaction(amount:500.0, transactionDate: "02-14-2023, 17:44", type: .withdrawal)
        
        let t4 = Transaction(amount:1000.0, transactionDate: "02-10-2023, 18:44", type: .deposit)
        
        let t5 = Transaction(amount:700.0, transactionDate: "02-09-2023, 09:44", type: .withdrawal)
        
        let t6 = Transaction(amount:900.0, transactionDate: "02-01-2023, 10:44", type: .deposit)
        
        return Account(accountNumber: "123456789", balance: 2000.0, transactionHistory: [t1, t2, t3, t4, t5, t6])
    }
}
