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
    
    static func createModule() -> UIViewController {
        let viewController = ConfirmationViewController()
        
        let router = ConfirmationRouter()
        let interactor = ConfirmationInteractor()
        
        let presenter: ConfirmationPresenterProtocol & ConfirmationInteractorDelegate = ConfirmationPresenter(view: viewController, interactor: interactor, router: router)
        
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateNewModule() {
        
    }
}
