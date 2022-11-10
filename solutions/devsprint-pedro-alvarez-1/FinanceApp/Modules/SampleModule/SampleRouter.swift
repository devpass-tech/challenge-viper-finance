//
//  SampleRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

class SampleRouter: SampleRouterProtocol {

    static func createModule() -> UINavigationController {

        let viewController = SampleViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: SamplePresenterProtocol & SampleInteractorDelegate = SamplePresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = SampleRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SampleInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }

    func navigateToNewModule() {

    }
}
