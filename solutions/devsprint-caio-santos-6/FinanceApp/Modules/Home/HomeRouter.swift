//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Yannes Meneguelli on 04/07/22.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {

    
    static func createModule() -> UIViewController {
        let viewController: HomeViewController = HomeViewController()
        let presenter: HomePresenterProtocol & HomeInteractorDelegate = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func navigationToNewScreen(navigation: UINavigationController) {
        navigation.present(UserProfileViewController(), animated: true)
    }
}
