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
		let presenter: TransfersInterable = TransfersPresenter(
			interactor: interactor,
			router: router
		)
		let viewController = TransfersViewController(presenter: presenter)
		
		router.viewController = viewController
		
		viewController.presenter.view = viewController
		viewController.presenter.interactor.presenter = presenter
		
		return viewController
	}
	
	func navigateToContactList() {
		let navController = ContactListRouter.createModule()
		self.viewController?.present(navController, animated: true)
	}
	
	func navigateToConfirmation() {
		let navController = ConfirmationRouter.createModule()
		self.viewController?.present(navController, animated: true)
	}
	
}
