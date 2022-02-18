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
        let service = FinanceService()
        let interactor = TransfersInteractor(service: service)
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
		let viewController = ContactListRouter.createModule()
		let navController = UINavigationController(rootViewController: viewController)
		self.viewController?.present(navController, animated: true)
	}
	
    func navigateToConfirmation(confirmation: ConfirmationEntity) {
        let viewController = ConfirmationRouter.createModule(confirmation: confirmation)
		self.viewController?.showDetailViewController(viewController, sender: self)
	}
	
}
