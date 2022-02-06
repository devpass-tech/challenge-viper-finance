//
//  ContactListEntity.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 05/02/22.
//

import Foundation

// MARK: - ContactEntity
struct ContactEntity: Codable {
    let name: String
    let phone: String
}

typealias ContactListEntity = [ContactEntity]
