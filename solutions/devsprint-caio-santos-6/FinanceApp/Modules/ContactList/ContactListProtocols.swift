//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

protocol ContactListPresenterProtocol: AnyObject {
	var view: ContactListPresenterDelegate? { get set }
	var interactor: ContactListInteractorDelegate? { get set }
	func numberOfRowsInSection() -> Int
	func getDTOforCell(at row: IndexPath) -> ContactCellView.DTO?
}

protocol ContactListPresenterDelegate: AnyObject  {
	var presenter: ContactListPresenterProtocol? { get set }
	func updateView()
}

protocol ContactListInteractorProtocol: AnyObject {
	var presenter: ContactListInteractorDelegate? { get set }
}

protocol ContactListInteractorDelegate: AnyObject {
	
}
