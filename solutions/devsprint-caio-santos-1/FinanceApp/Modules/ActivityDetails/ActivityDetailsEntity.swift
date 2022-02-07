//
//  ActivityDetailsEntity.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 06/02/22.
//

struct ActivityDetailsEntity: Codable {
    let name, category: String?
    let price: Double?
    let time: String?
    
    init(name: String, category: String, price: Double, time: String) {
        self.name       = name
        self.category   = category
        self.price      = price
        self.time       = time
    }
}
