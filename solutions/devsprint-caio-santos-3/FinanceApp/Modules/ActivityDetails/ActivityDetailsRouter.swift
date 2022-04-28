//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 26/04/22.
//

import Foundation
import UIKit

class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UINavigationController {
        
        let viewController = ActivityDetailsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let router = ActivityDetailsRouter()
        let interactor = ActivityDetailsInteractor()
        
        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter(view: viewController,
                                                                                                                       interactor: interactor,
                                                                                                                       router: router)
        
        interactor.presenter = presenter
        router.viewController = viewController
        
        return navigationController
    }
    
    func navigateToNewModule() {
        
    }

}
