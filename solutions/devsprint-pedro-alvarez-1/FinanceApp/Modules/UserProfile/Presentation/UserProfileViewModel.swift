//
//  UserProfileViewModel.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 23/11/22.
//

import Foundation

struct UserProfileViewModel: Decodable {

    let name: String
    let phone: String
    let email: String
    let address: String
    let account: Account
}
