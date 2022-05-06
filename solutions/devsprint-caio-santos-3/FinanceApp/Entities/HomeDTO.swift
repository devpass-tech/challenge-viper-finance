//
//  HomeDTO.swift
//  FinanceApp
//
//  Created by pedro tres on 04/05/22.
//

import Foundation

struct HomeDTO {
    let balance: String
    let savings, spending: String
    let activity: [ActivityDTO]
}

struct ActivityDTO {
    let name: String
    let info: String
}
