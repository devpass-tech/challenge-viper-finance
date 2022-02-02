//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import Foundation
import UIKit

class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    static func createModule() -> UINavigationController {
        
        let viewController = ActivityDetailsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ActivityDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ActivityDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToNewModule() {
        
    }
}
