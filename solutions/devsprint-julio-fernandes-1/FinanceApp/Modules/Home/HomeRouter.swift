//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Mateus Nazario on 09/02/22.
//

import UIKit

typealias HomeInterable = HomePresenterProtocol & HomeInteractorDelegate

final class HomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        let interactor = HomeInteractor()
        let router = HomeRouter()
        var presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
        let viewController: HomeViewController = HomeViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
