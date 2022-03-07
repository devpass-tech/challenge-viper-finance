//
//  HomeEntity.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 08/02/22.
//

import Foundation

struct HomeEntity: Decodable {
	let balance: Double
	let savings: Double
	let spending: Double
	let listActivity: [ActivityEntity]
	
	private enum CodingKeys: String, CodingKey {
		case balance, savings, spending
		case listActivity = "activity"
	}
}
