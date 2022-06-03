//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Mobills on 02/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    
    func fetchData() {
        presenter?.didLoadData(.init(
            username: "User Name",
            agency: "Agency 0001",
            account: "Account 123456-7",
            bank: "Devpass Bank",
            personalData: [
                .init(label: "Phone", content: "+55 (11) 99999-9999"),
                .init(label: "E-mail", content: "user@devpass.com"),
                .init(label: "Address", content: "Rua Bela Cintra, 495")
            ]
        ))
    }
}
