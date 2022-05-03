//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import Foundation

final class UserProfilePresenter: UserProfilePresenterProtocol {

    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?

    func viewDidLoad() {
        interactor?.fetchData()
    }

}

extension UserProfilePresenter: UserProfileInteractorDelegate {

    func didFetchData() {
        view?.showData()
    }

}
