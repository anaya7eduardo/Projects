//
//  String+Extension.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        
        var isValid = true
        
        let emailRegex = "[A-Z0-9a-z,-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let expression = try NSRegularExpression(pattern: emailRegex)
            
            let result = expression.matches(in: self, range: NSRange(location: 0, length: self.count))
            
            if result.count == 0 {
                isValid = false
            }
            
        } catch {
            isValid = false
        }
            return isValid
    }
    
}
