//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 01/02/22.
//

import Foundation

protocol UserProfileInteractorDelegate: AnyObject {
    func didFetchData(_ userProfile: UserEntity)
}

final class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    private let service: FinanceServiceProtocol
	
    init(service: FinanceServiceProtocol) {
        self.service = service
    }
	
    func fetchData() {
        service.load(endpoint: .userProfile) { (response: Result<UserEntity, Error>) in
            switch response {
            case let .success(userProfile): self.presenter?.didFetchData(userProfile)
            default: break
            }
         }
    }

}
