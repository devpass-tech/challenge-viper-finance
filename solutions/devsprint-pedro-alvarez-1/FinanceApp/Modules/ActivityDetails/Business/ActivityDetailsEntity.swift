//
//  ActivityDetailsEntity.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import Foundation

struct ActivityDetailsEntity: Decodable {
    let name: String
    let price: Float
    let category: String
    let time: String
    
    static var stub: ActivityDetailsEntity {
        ActivityDetailsEntity(
            name: "Mall",
            price: 100.0,
            category: "Shopping",
            time: "8:57 AM"
        )
    }
}
