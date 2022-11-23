//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import Foundation

protocol UserProfileInteractorInput {
    func fetchUserProfile()
}

protocol UserProfileInteractorOutput: AnyObject {
    func didFetchUserProfile(_ userProfile: UserProfile?)
}

final class UserProfileInteractor {

    private let service: FinanceServiceProtocol
    weak var presenter: UserProfileInteractorOutput?

    init(service: FinanceServiceProtocol = FinanceService()) {
        self.service = service
    }
}

extension UserProfileInteractor: UserProfileInteractorInput {

    func fetchUserProfile() {
        service.fetchUserProfile { userProfile in
            self.presenter?.didFetchUserProfile(userProfile)
        }
    }
}


