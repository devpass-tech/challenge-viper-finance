//
//  SampleConfigurator.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import UIKit

public final class SampleV2Configurator {
    public func createModule(transporter: Transporter<Any>) -> UIViewController {
        let router = SampleV2Router()
        let interactor = SampleV2Interactor(jsonLoader: JsonLoader())
        let presenter = SampleV2Presenter(router: router, interactor: interactor, transporter: transporter)
        let viewController = SampleV2ViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.output = presenter
        
        return viewController
    }
}
