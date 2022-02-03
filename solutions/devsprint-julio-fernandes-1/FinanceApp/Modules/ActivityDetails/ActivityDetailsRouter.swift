//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import UIKit

class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = ActivityDetailsViewController()
        
        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter()
      
        viewController.presenter?.interactor = ActivityDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return viewController
    }
    
    func navigateToNewModule() {
        
    }
}
