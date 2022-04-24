//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import Foundation

protocol ContactListPresenterDelegate: AnyObject {
    func showData(_ contactList: [ContactEntity])
}

final class ContactListPresenter: ContactListPresenterProtocol {
	
	weak var view: ContactListPresenterDelegate?
	var interactor: ContactListInteractorProtocol
	var router: ContactListRouterProtocol
	
	init(
		interactor: ContactListInteractorProtocol,
		router: ContactListRouterProtocol
	) {
		self.interactor = interactor
		self.router = router
	}
	
	func viewDidLoad() {
		interactor.fetchData()
	}
}

extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(contactList: [ContactEntity]) {
        view?.showData(contactList)
    }
}
