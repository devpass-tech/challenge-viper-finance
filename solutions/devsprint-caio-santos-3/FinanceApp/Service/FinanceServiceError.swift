//
//  FinanceServiceError.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 29/04/22.
//

import Foundation

enum FinanceServiceError: Error {
    case invalidURL
    case errorGeneric(description: String)
    case invalidResponse
    case invalidData
    case errorDecoder
}
