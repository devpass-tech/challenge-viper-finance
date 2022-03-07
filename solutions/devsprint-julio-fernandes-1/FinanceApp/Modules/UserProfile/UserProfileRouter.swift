//
//  UserProfileRouter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 01/02/22.
//

import UIKit

typealias UserProfileInterable = UserProfilePresenterProtocol & UserProfileInteractorDelegate

final class UserProfileRouter: UserProfileRouterProtocol {
	
	static func createModule() -> UINavigationController {
		let service: FinanceService = .init()
		let interactor = UserProfileInteractor(service: service)
		let router = UserProfileRouter()
		let presenter: UserProfileInterable = UserProfilePresenter(
			interactor: interactor,
			router: router
		)
		
		let viewController = UserProfileViewController(presenter: presenter)
		let navigationController = UINavigationController(rootViewController: viewController)
		
		viewController.presenter.view = viewController
		viewController.presenter.interactor.presenter = presenter
		
		return navigationController
	}
	
}
