//
//  UserProfileDefinitions.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/07/22.
//

struct User: Codable {
    let name: String?
    let phone: String?
    let email: String?
    let address: String?
    let account: Account?
    
    init(name: String? = nil,
         phone: String? = nil,
         email: String? = nil,
         address: String? = nil,
         account: Account? = nil) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.account = account
    }
}

struct Account: Codable {
    let agency: String?
    let account: String?
}

struct AccountData {
    let label: String?
    let value: String?
}
