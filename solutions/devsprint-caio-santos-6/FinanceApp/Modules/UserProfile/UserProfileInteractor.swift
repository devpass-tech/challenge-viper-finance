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
        presenter?.didFetchData(user: .init(), accountInfos: [])
            // Erro
//                presenter?.didFetchDataWithError()
    }
}
