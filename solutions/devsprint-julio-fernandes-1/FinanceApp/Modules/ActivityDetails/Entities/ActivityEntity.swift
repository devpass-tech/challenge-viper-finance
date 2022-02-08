//
//  ActivityEntity.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 08/02/22.
//

import Foundation

struct ActivityEntity: Decodable {
	let name: String
	let price: Double
	let time: String
}
