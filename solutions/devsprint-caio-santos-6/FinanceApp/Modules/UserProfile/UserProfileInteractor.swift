//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/07/22.
//

import Foundation

class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    
    let apiURL = "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/user_profile_endpoint.json"
    
    func fetchData() {
        // CHAMADA DE API
        // case result
            // Sucesso
        
        DispatchQueue.global().async { [weak self] in
            guard let safeSelf = self else { return }
            safeSelf.presenter?.didFetchData(user: User.fixture(), accountInfos: safeSelf.getAccountInfos())
        }
            // Erro
//                presenter?.didFetchDataWithError()
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
