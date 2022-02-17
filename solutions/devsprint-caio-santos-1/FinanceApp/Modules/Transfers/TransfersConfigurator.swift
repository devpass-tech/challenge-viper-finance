//
//  TransfersConfigurator.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 08/02/22.
//

import Foundation
import UIKit

public final class TransfersConfigurator {
    public func createModule() -> UIViewController {
        let router = TransfersRouter()
        let interactor = TransfersInteractor(jsonLoader: JsonLoader())
        let presenter = TransfersPresenter(router: router, interactor: interactor)
        let viewController = TransfersViewController(presenter: presenter)
        
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.output = presenter
        
        return viewController
    }
}
