//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import UIKit

// MARK: - HomeRouter

final class HomeRouter: HomeRouterProtocol {
    
    // MARK: Public Methods
    
    static func createModule() -> UIViewController {
        let viewController = HomeViewController()
        
        let presenter: HomePresenterProtocol & HomeInteractorDelegate = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
