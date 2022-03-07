//
//  ConfirmationRouter.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
import UIKit

typealias ConfirmationInterable = ConfirmationPresenterProtocol

final class ConfirmationRouter: ConfirmationRouterProtocol {

    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        let router: ConfirmationRouterProtocol = ConfirmationRouter()

        let presenter: ConfirmationInterable = ConfirmationPresenter(
            router: router,
            confirmation: confirmation
        )

        let viewController = ConfirmationViewController(presenter: presenter)
        viewController.presenter.view = viewController

        return viewController
    }

}
