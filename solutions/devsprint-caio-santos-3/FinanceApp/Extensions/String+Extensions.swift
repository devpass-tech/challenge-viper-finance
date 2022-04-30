//
//  String+Extensions.swift
//  FinanceApp
//
//  Created by Caio Santos on 29/04/22.
//

import Foundation

extension String {
    func removingSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return count >= 4
    }
}
