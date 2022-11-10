//
//  UserProfile.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

struct UserProfile: Decodable {

    let name: String
    let phone: String
    let email: String
    let address: String
    let account: Account
}

struct Account: Decodable {

    let agency: String
    let account: String
}
