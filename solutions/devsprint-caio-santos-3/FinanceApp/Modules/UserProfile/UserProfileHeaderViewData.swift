//
//  UserProfileHeaderViewData.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/05/22.
//

import Foundation

struct UserProfileHeaderViewData: UserProfileHeaderViewProtocol {
    let name: String
    let agency: String
    let account: String
    let bank: String
    
    init(user: UserEntity) {
        name = user.name
        agency = "Agency \(user.account?.agency ?? "0000")"
        account = "Account \(user.account?.account ?? "000000-0")"
        bank = "Devpass Bank"
    }

}
