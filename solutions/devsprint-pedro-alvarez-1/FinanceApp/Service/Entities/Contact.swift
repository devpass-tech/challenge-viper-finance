//
//  Contact.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

struct Contact: Decodable {

    let name: String
    let phone: String

    static let stub: [Self] = [
        .init(name: "Rodrigo", phone: "11111111"),
        .init(name: "Mario", phone: "22222222"),
        .init(name: "Fernando", phone: "33333333"),
        .init(name: "Ronaldo", phone: "44444444"),
        .init(name: "Pedro", phone: "55555555"),
        .init(name: "Neymar", phone: "6666666"),
        .init(name: "Lebron", phone: "77777777"),
        .init(name: "Tom", phone: "88888888"),
        .init(name: "Danilo", phone: "99999999")
    ]
}
