//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation
import UIKit

typealias HomeInterable = HomePresenterProtocol & HomeInteractorDelegate

final class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        let interactor = HomeInteractor(service: service)
        let router = HomeRouter()
        var presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
        let viewController: HomeViewController = HomeViewController(presenter: presenter)
        
        presenter.view = viewController
        router.viewController = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func presentUserProfile() {
        viewController?.present(UserProfileFactory().createModule(), animated: true)
    }
    
    func pushToActivityDetails() {
        viewController?.navigationController?.pushViewController(ActivityDetailsRouter.createModule(), animated: true)
    }
}
