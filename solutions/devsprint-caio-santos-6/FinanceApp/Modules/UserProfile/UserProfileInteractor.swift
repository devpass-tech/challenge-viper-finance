//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/07/22.
//

import Foundation

class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    private let service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .userProfile) { [weak self] (response: Result<User, FinanceServiceError>) in
            guard let safeSelf = self else { return }
            
            switch response {
            case let .success(user):
                safeSelf.presenter?.didFetchData(user: user, accountInfos: safeSelf.getAccountInfos())
            case .failure:
                safeSelf.presenter?.didFetchDataWithError()
            }
        }
    }
    
    func getAccountInfos() -> [AccountData] {
        return [
            .init(label: "label 1", value: "value 1"),
            .init(label: "label 2", value: "value 2"),
            .init(label: "label 3", value: "value 3"),
            .init(label: "label 4", value: "value 4"),
            .init(label: "label 5", value: "value 5")
        ]
    }
}
