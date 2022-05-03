//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import Foundation

final class UserProfileInteractor: UserProfileInteractorProtocol {

    weak var presenter: UserProfileInteractorDelegate?
    
    let service: FinanceServiceProtocol!
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .userProfile) { [weak presenter] (response: Result<UserEntity, FinanceServiceError>) in
            switch response {
                case let .success(success):
                    presenter?.didFetchData(success)
                case let .failure(failure):
                    presenter?.didErrorData(error: failure)
            }
        }
    }

}
