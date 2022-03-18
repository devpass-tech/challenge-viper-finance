//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import UIKit

// MARK: - ActivityDetailsRouter

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    // MARK: Public Methods

    static func createModule() -> UIViewController {
        let viewController = ActivityDetailsViewController()

        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = ActivityDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ActivityDetailsInteractor(service: FinanceService())
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}
