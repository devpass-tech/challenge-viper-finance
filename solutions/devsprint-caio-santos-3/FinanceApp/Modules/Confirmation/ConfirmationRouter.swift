//
//  ConfirmationRouter.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 28/04/22.
//

import Foundation
import UIKit

class ConfirmationRouter: ConfirmationRouterProtocol {

    weak var viewController: UIViewController?
    
    static func createModule() -> UINavigationController {
        
        let viewController = ConfirmationViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        
        let router = ConfirmationRouter()
        let interactor = ConfirmationInteractor()
        
        let presenter: ConfirmationPresenterProtocol & ConfirmationInteractorDelegate = ConfirmationPresenter(view: viewController, interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.viewController = viewController
        
        return navigation
        
    }
    
    func navigateNewModule() {
        
    }
}
