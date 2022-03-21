//
//  Activity.swift
//  FinanceApp
//
//  Created by Victor Catão on 17/03/22.
//

import Foundation

struct Activity: Codable {
    
    enum CategoryType: String, Codable {
        case shopping = "Shopping"
    }
    
    let name: String
    let category: CategoryType?
    let price: Double
    let time: String
}
