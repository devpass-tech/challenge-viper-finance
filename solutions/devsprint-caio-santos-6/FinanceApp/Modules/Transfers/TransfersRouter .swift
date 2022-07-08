//
//  TransfersRouter .swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

class TransfersRouter: TransfersRouterProtocol {
    static func makeTransfersController() -> UIViewController {
        let viewController  = TransfersViewController()
        let presenter: TransfersPresenterProtocol & TransfersInteractorDelegate = TransfersPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TransfersRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransfersInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
