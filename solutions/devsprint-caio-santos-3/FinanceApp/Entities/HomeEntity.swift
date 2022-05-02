//
//  HomeEntity.swift
//  FinanceApp
//
//  Created by pedro tres on 02/05/22.
//

import Foundation

struct Home: Codable {
    let balance: Double
    let savings, spending: Int
    let activity: [Activity]
}

struct Activity: Codable {
    let name: String
    let price: Int
    let time: String
}
