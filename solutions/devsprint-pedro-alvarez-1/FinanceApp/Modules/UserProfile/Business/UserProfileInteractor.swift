//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import Foundation

protocol UserProfileInteractorInput {

}

protocol UserProfileInteractorOutput: AnyObject {

}

final class UserProfileInteractor: UserProfileInteractorInput {

    private let service: FinanceServiceProtocol
    weak var presenter: UserProfileInteractorOutput?

    init(service: FinanceServiceProtocol = FinanceService()) {
        self.service = service
    }
}
