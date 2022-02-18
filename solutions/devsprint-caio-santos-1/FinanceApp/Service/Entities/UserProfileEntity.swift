//
//  UserProfileEntity.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 08/02/22.
//

import Foundation

// MARK: - UserProfile
struct UserProfileEntity: Codable {
    let name: String
    let phone: String
    let email: String
    let address: String
    let account: AccountEntity
    
    init(name: String, phone: String, email: String, address: String, account: AccountEntity) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.account = account
    }
}

// MARK: - Account
struct AccountEntity: Codable {
    let agency: String
    let account: String
    let bank: String
    
    init(agency: String, account: String, bank: String) {
        self.agency = agency
        self.account = account
        self.bank = bank
    }
}
