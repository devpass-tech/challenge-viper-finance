//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation

final class ContactListPresenter: ContactListPresenterProtocol {

    var view: ContactListPresenterDelegate?
    private let interactor: ContactListInteractorProtocol
    private let router: ContactListRouterProtocol

    internal init(interactor: ContactListInteractorProtocol,
                  router: ContactListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {

        interactor.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(contactList: [ContactListEntity]) {
        view?.showData(contactList)
    }
}
