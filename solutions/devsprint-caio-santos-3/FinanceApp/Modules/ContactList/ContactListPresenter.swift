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

    internal init(view: ContactListPresenterDelegate?,
                  interactor: ContactListInteractorProtocol?,
                  router: ContactListRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {

        interactor?.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {

    func didFetchData() {

        view?.showData()
    }
}
