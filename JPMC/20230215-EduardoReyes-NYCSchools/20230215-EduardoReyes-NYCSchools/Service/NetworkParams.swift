//
//  NetworkParams.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation

protocol Session {
    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    
    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
        
    }
    
}
