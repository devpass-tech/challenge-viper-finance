//
//  DoubleExtension.swift
//  FinanceApp
//
//  Created by pedro tres on 02/05/22.
//

import Foundation

extension Double {
    func toBRLCurrency(identifier: String = "pt_BR") -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: identifier)
        formatter.numberStyle = .currency
        return formatter.string(for: self)
    }
}
