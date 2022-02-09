//
//  ConfirmationRouter.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
import UIKit

typealias ConfirmationInterable = ConfirmationPresenterProtocol & ConfirmationInteractorDelegate

final class ConfirmationRouter: ConfirmationRouterProtocol {

    static func createModule() -> UIViewController {
        let interactor: ConfirmationInteractorProtocol = ConfirmationInteractor()
        let router: ConfirmationRouterProtocol = ConfirmationRouter()

        let presenter: ConfirmationInterable = ConfirmationPresenter(
            interactor: interactor,
            router: router
        )

        let viewController = ConfirmationViewController(presenter: presenter)
        viewController.presenter.view = viewController
        viewController.presenter.interactor.presenter = presenter

        return viewController
    }

}
