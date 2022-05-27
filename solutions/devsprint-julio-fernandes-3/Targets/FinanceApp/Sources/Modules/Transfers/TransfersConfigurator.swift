//
//  TransfersConfigurator.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class TransfersConfigurator: TransfersConfiguratorProtocol {
    static func createModule() -> UIViewController {
        let view = TransfersViewController()
        let presenter = TransfersPresenter()
        let interactor = TransfersInteractor()
        let router = TransfersRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
