//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation
import UIKit

class ContactListRouter: ContactListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let viewController = ContactListViewController()
        
        let router = ContactListRouter()
        let interactor = ContactListInteractor()
        
        let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter(view: viewController,
                                                                                                                       interactor: interactor,
                                                                                                                       router: router)
        
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToNewModule() {
        
    }
}

