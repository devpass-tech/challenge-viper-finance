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
    
    static func createModule() -> UIViewController {
        
        let viewController = ActivityDetailsViewController()
        
        let router = ActivityDetailsRouter()
        let interactor = ActivityDetailsInteractor()
        
        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter(view: viewController,
                                                                                                                       interactor: interactor,
                                                                                                                       router: router)
        
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToNewModule() {
        
    }

}
