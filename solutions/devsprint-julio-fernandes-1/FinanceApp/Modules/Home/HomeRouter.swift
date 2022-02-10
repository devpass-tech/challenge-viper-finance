//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Mateus Nazario on 09/02/22.
//

import UIKit

typealias HomeInterable = HomePresenterProtocol & HomeInteractorDelegate

final class HomeRouter: HomeRouterProtocol {
	
	weak var viewController: UIViewController?
	
    static func createModule() -> UIViewController {
        let interactor = HomeInteractor()
        let router = HomeRouter()
        var presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
		 
        let viewController: HomeViewController = HomeViewController(presenter: presenter)
		 router.viewController = viewController
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
	
    func navigateToActivity() {
        let viewController = ActivityDetailsRouter.createModule()
        self.viewController?.show(viewController, sender: self)
    }
	
    func navigateToUserProfile() {
        let viewController = UserProfileRouter.createModule()
        self.viewController?.showDetailViewController(viewController, sender: self)
    }

}
