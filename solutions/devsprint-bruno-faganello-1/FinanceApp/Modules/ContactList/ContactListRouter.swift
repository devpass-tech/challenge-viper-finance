//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Victor Catão on 21/03/22.
//

import UIKit

// MARK: ContactListRouter

final class ContactListRouter: ContactListRouterProtocol {
    
    // MARK: Public Methods

    static func createModule() -> UIViewController {
        let viewController = ContactListViewController()
        
        let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ContactListRouter()
        viewController.presenter?.view = ContactListViewController()
        viewController.presenter?.interactor = ContactListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
