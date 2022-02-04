//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {
	func didFetchData()
}

final class ContactListInteractor: ContactListInteractorProtocol {
	weak var presenter: ContactListInteractorDelegate?
	
	func fetchData() {
		presenter?.didFetchData()
	}
	
}
