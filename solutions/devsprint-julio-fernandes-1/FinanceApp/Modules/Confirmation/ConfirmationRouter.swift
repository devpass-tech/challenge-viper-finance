//
//  ConfirmationRouter.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
import UIKit

final class ConfirmationRouter: ConfirmationRouterProtocol {

    static func createModule() -> UINavigationController {

        let viewController = ConfirmationViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: ConfirmationPresenterProtocol & ConfirmationInteractorDelegate = ConfirmationPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = ConfirmationRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ConfirmationInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }

}
