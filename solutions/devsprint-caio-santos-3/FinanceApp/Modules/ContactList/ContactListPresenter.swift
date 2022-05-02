//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation

class ContactListPresenter: ContactListPresenterProtocol {

    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?

    func viewDidLoad() {

        interactor?.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {

    func didFetchData() {

        view?.showData()
    }
}
