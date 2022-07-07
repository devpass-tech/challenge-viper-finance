//
//  ContactListConfigurator.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation


struct ContactListRouter {
	static func createModule() -> ContactListViewController {
		let view = ContactListViewController()
		let presenter =  ContactListPresenter()
		view.presenter = presenter
		presenter.view = view
		return view
	}
}
