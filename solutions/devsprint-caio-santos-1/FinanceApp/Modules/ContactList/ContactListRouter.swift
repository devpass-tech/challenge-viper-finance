//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import UIKit

protocol ContactListRouterProtocol {
    
    static func createModule() -> UINavigationController
    func navigateToNewModule()
}

final class ContactListRouter: ContactListRouterProtocol {
    static func createModule() -> UINavigationController {
        let viewController = ContactListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ContactListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ContactListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToNewModule() {
    }
    
}
