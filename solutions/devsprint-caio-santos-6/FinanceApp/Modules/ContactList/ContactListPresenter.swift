//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

class ContactListPresenter: ContactListPresenterProtocol {
	
	weak var view: ContactListPresenterDelegate?
	weak var interactor: ContactListInteractorDelegate?
	
	func getDTOforCell(at row: IndexPath) -> ContactCellView.DTO? {
		.init(avatarImageName: "avatar-placeholder", contactNameText: "Contact name", contactPhoneText: "5555-55555")
	}
	
	func numberOfRowsInSection() -> Int {
		10
	}
}

extension ContactListPresenter: ContactListInteractorDelegate {
	
}
