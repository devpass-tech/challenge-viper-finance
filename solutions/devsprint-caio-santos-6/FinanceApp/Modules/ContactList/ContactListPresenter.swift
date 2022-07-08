//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

class ContactListPresenter: ContactListPresenterProtocol {
	
	weak var view: ContactListPresenterDelegate?
	var interactor: ContactListInteractorProtocol?
	var contacts: [Contact] = [] {
		didSet {
			view?.updateView()
		}
	}
	
	func viewDidLoad() {
		interactor?.fetchData()
	}
	
	func getDTOforCell(at indexPath: IndexPath) -> ContactCellView.DTO? {
		guard contacts.indices.contains(indexPath.row) else { return nil }
		let contact = contacts[indexPath.row]
		return .init(avatarImageName: contact.image,
					 contactNameText: contact.name,
					 contactPhoneText: contact.phone)
	}
	
	func numberOfRowsInSection() -> Int {
		contacts.count
	}
}

extension ContactListPresenter: ContactListInteractorDelegate {
	func didFetchWithError() {
		view?.showError(message: "Aconteceu algo inesperado")
	}
	
	func didFetchData(contacts: [Contact]) {
		self.contacts = contacts
	}
}
