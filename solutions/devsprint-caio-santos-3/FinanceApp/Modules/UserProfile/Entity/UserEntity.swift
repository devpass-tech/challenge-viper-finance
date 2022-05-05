//
//  UserEntity.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/05/22.
//

import Foundation

struct UserEntity: Decodable {
    let name: String
    let phone: String
    let email: String
    let address: String
    let account: AccountEntity?
}
