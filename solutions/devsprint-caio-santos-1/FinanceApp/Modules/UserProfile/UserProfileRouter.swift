//
//  UserProfileRouter.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import UIKit

protocol UserProfileRouterProtocol {
    
    static func createModule() -> UINavigationController
    func navigateToNewModule()
}

final class UserProfileRouter: UserProfileRouterProtocol {
    static func createModule() -> UINavigationController {
        let viewController = UserProfileViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: UserProfilePresenterProtocol & UserProfileInteractorDelegate = UserProfilePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UserProfileRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserProfileInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToNewModule() {
    }
    
}
