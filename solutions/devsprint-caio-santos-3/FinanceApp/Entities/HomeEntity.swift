//
//  HomeEntity.swift
//  FinanceApp
//
//  Created by pedro tres on 02/05/22.
//

import Foundation

struct Home: Codable {
    let balance: Double
    let savings, spending: Double
    let activity: [Activity]
}

struct Activity: Codable {
    let name: String
    let price: Double
    let time: String
}
