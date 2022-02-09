//
//  FinanceServiceError.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 09/02/22.
//

import Foundation

enum FinanceServiceError: Error {
    case decode, invalidData, invalidURL
}
