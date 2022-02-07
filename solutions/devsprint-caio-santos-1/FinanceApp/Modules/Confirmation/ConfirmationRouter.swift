//
//  ConfirmationRouter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation
import UIKit

final class ConfirmationRounter: ConfirmationRouterProtocol {
    static func createModule(statusTransfer: Bool) -> UINavigationController {
        
        let viewController = ConfirmationViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter: ConfirmationPresenterProtocol & ConfirmationInteractorDelegate = ConfirmationPresenter()
        if let confirmationPresenter = presenter as? ConfirmationPresenter {
            confirmationPresenter.statusTransfer = statusTransfer
        }
        viewController.presenter = presenter
        viewController.presenter?.router = ConfirmationRounter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ConfirmationInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
}
