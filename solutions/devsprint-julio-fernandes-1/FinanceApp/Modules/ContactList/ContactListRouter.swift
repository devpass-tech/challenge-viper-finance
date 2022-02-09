//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import UIKit

typealias ContactListInterable = ContactListPresenterProtocol & ContactListInteractorDelegate

final class ContactListRouter: ContactListRouterProtocol {
	
	static func createModule() -> UINavigationController {
        let provider: ContentProviderProtocol = LocalJSONProvider()
        let interactor = ContactListInteractor(provider: provider)
		let router = ContactListRouter()
		let presenter: ContactListInterable = ContactListPresenter(
			interactor: interactor,
			router: router
		)
		
		let viewController = ContactListViewController(presenter: presenter)
		let navigationController = UINavigationController(rootViewController: viewController)
		
		viewController.presenter.view = viewController
		viewController.presenter.interactor.presenter = presenter
		
		return navigationController
	}
	
}
