//
//  FinanceApp+Double.swift
//  FinanceApp
//
//  Created by Victor Catão on 17/03/22.
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
