//
//  ContactListConfigurator.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

struct ContactListRouter: ContactListRouterProtocol {
	func createModule() -> ContactListViewController {
		let view = ContactListViewController()
		let presenter =  ContactListPresenter()
		let interactor = ContactListInteractor()

		presenter.view = view
		presenter.interactor = interactor
		
		interactor.presenter = presenter
		
		view.presenter = presenter
		return view
	}
}
