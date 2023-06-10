//
//  EmployeeData.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/22/23.
//

import Foundation

// MARK: - EmployeeDataElement
struct Employee: Codable {
    let createdAt, firstName, avatar, lastName: String
    let email, jobtitle, favouriteColor, id: String
    let data: EmployeeData?
    let to, fromName: String?
    let name, type, size: String?
}

// MARK: - DataClass
struct EmployeeData: Codable {
    let title, body: String
    let id: String?
    let toId, fromId, meetingid: String
}
