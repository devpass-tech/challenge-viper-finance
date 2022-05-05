//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation
import UIKit

final class ContactListRouter: ContactListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        
        
        let router = ContactListRouter()
        let interactor = ContactListInteractor(service: service)
        var presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter(
                                                                                        interactor: interactor,
                                                                                        router: router
                                                                                        )
        let viewController = ContactListViewController(presenter: presenter)
        
        interactor.presenter = presenter
        router.viewController = viewController
        presenter.view = viewController
        return viewController
    }
    
    func navigateToNewModule() {
        
    }
}

