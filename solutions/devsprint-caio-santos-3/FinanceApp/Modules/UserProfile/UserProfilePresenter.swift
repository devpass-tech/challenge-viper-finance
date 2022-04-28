//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import Foundation

class UserProfilePresenter: UserProfilePresenterProtocol {

    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchData()
    }

}

extension UserProfilePresenter: UserProfileInteractorDelegate {

    func didFetchData() {
        view?.showData()
    }

}
