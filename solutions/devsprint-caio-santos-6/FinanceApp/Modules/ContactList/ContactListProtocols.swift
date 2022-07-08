//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

protocol ContactListPresenterProtocol: AnyObject {
	var view: ContactListPresenterDelegate? { get set }
	var interactor: ContactListInteractorProtocol? { get set }
	func numberOfRowsInSection() -> Int
	func getDTOforCell(at row: IndexPath) -> ContactCellView.DTO?
	func viewDidLoad()
}

protocol ContactListPresenterDelegate: AnyObject {
	func updateView()
	func showError(message: String)
}

protocol ContactListInteractorProtocol: AnyObject {
	var presenter: ContactListInteractorDelegate? { get set }
	func fetchData()
}

protocol ContactListInteractorDelegate: AnyObject {
	func didFetchData(contacts: [Contact])
	func didFetchWithError()
}

protocol ContactListRouterProtocol {
	func createModule() -> ContactListViewController
}
