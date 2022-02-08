//
//  ServiceError.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 08/02/22.
//

import Foundation

enum ServiceError: Error {
	case badRequest
	case genericError(String)
	case httpError(Int)
	case noData
}
