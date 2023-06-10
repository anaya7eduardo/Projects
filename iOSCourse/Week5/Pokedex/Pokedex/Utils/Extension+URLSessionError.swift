//
//  Extension+URLSessionError.swift
//  Pokedex
//
//  Created by Eduardo Anaya on 12/5/21.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
