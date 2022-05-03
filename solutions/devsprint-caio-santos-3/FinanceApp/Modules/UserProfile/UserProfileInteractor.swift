//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import Foundation

final class UserProfileInteractor: UserProfileInteractorProtocol {

    weak var presenter: UserProfileInteractorDelegate?

    func fetchData() {
        presenter?.didFetchData()
    }

}
