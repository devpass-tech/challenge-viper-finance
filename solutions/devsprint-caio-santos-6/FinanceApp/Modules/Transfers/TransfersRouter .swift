//
//  TransfersRouter .swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

class TransfersRouter: TransfersRouterProtocol {
    var viewController: UIViewController?
    
    internal init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    func navigateToContactList() {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.present(ContactListRouter.createModule(), animated: true)
        }
    }
    
    func navigateToConfirmation() {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.present(ConfirmationConfigurator().createModule(), animated: true)
        }
    }
    
    static func makeTransfersController() -> UIViewController {
        let viewController  = TransfersViewController()
        let presenter: TransfersPresenterProtocol & TransfersInteractorDelegate = TransfersPresenter()
        let router = TransfersRouter(viewController: viewController)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransfersInteractor(service: NetworkService())
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
