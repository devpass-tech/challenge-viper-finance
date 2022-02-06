//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import UIKit

typealias TransfersInterable = TransfersPresenterProtocol & TransfersInteractorDelegate

final class TransfersRouter: TransfersRouterProtocol {
	
	weak var viewController: UIViewController?
	
	static func createModule() -> UIViewController {
		let interactor = TransfersInteractor()
		let router = TransfersRouter()
		var presenter: TransfersInterable = TransfersPresenter(
			interactor: interactor,
			router: router
		)
		let viewController = TransfersViewController(presenter: presenter)
		
		router.viewController = viewController
		presenter.view = viewController
		interactor.presenter = presenter
		
		return viewController
	}
	
	func navigateToContactList() {
		let navController = ContactListRouter.createModule()
		self.viewController?.show(navController, sender: self)
	}
	
	func navigateToConfirmation() {
		let navController = ConfirmationRouter.createModule()
		self.viewController?.show(navController, sender: self)
	}
	
}
