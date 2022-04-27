//
//  ContactListRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation
import UIKit

class ContactListRouter: ContactListRouterProtocol {

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

