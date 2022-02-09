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
        let viewController: HomeViewController = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor.presenter = presenter
        
        return viewController
    }
}
