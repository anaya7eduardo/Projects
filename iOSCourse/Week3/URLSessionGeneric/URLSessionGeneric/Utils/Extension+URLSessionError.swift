//
//  Extension+URLSessionError.swift
//  URLSessionGeneric
//
//  Created by Eduardo Anaya on 12/2/21.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}
