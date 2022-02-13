//
//  ConfirmationConfigurator.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 09/02/22.
//

import Foundation
import UIKit

public final class ConfirmationConfigurator {
    public func createModule(transporter: Transporter<Any>?) -> UIViewController {
        let router = ConfirmationRouter()
        let interactor = ConfirmationInteractor(jsonLoader: JsonLoader())
        let presenter = ConfirmationPresenter(
            router: router,
            interactor: interactor,
            transporter: transporter
        )
        let viewController = ConfirmationViewController(presenter: presenter)
        
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.output = presenter
        
        return viewController
    }
}
