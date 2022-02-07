//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

final class TransfersRouter: TransfersRouterProtocol {

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
    
    func navigateToContactList(navigationController: UINavigationController) {
        navigationController.present(ContactListRouter.createModule(), animated: true)
    }
    
    func navigateToConfirmation(navigationController: UINavigationController) {
        navigationController.present(ConfirmationRounter.createModule(), animated: true)
    }
}
