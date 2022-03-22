//
//  HomeInformation.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import Foundation

struct HomeData: Codable {
    let balance: Double
    let savings: Double
    let spending: Double
    let activity: [Activity]
}
