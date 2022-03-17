//
//  FinanceApp+Double.swift
//  FinanceApp
//
//  Created by Victor Catão on 17/03/22.
//

import Foundation

extension Double {
    func toBRL() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(for: self)
    }
}
