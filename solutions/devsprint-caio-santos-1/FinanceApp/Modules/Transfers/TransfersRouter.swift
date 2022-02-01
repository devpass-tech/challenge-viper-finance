//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

class TransfersRouter: TransfersRouterProtocol {

    static func createModule() -> UINavigationController {
        
        let viewController = TransfersViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: TransfersPresenterProtocol & TransfersInteractorDelegate = TransfersPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TransfersRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransfersInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToNewModule() {
       
    }
}
