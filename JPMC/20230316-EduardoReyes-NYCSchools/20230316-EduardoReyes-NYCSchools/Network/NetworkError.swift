//
//  NetworkError.swift
//  20230316-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 3/16/23.
//

import Foundation

enum NetworkError: Error {
    case dataNotFoundError
    case APIError
    case invalidURL
    case parsingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotFoundError:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFoundError")
        case .APIError:
            return NSLocalizedString("API not responding", comment: "APIError")
        case .invalidURL:
            return NSLocalizedString("Wrong API Endpoint", comment: "invalidURL")
        case .parsingError:
            return NSLocalizedString("Failed to parse JSON", comment: "parsingError")
        }
    }
}
