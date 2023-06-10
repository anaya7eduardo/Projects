//
//  Extension+URLSessionError.swift
//  ExampleMapKit
//
//  Created by Eduardo Anaya on 12/15/21.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
