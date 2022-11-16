//
//  ActivityDetailsEntity.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import Foundation

struct ActivityDetails: Decodable {
    let name: String
    let price: Float
    let category: String
    let time: String
}
