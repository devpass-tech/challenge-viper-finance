//
//  ContactListConfigurator.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation


struct ContactListConfigurator {
	static func createModule() -> ContactListViewController {
		let viewController = ContactListViewController()
		viewController.presenter = ContactListPresenter()
		return viewController
	}
}
