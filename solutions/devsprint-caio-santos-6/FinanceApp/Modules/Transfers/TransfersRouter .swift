//
//  TransfersRouter .swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

class TransfersRouter: TransfersRouterProtocol {
    func navigateToContactList(navigation: UINavigationController) {
        navigation.present(ContactListViewController(), animated: true)
    }
    
    func navigateToConfirmation(navigation: UINavigationController) {
        navigation.present(ConfirmationViewController(), animated: true)
    }
    
    static func makeTransfersController() -> UIViewController {
        let viewController  = TransfersViewController()
        let presenter: TransfersPresenterProtocol & TransfersInteractorDelegate = TransfersPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TransfersRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
