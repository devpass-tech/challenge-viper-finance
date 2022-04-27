//
//  UserProfileRouter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import UIKit

class UserProfileRouter: UserProfileRouterProtocol {
    
    typealias UserProfilePresentable = UserProfilePresenterProtocol & UserProfileInteractorDelegate

    static func createModule() -> UINavigationController {
        var presenter: UserProfilePresentable = UserProfilePresenter()
        let interactor = UserProfileInteractor()
        let viewController = UserProfileViewController(presenter: presenter)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        presenter.view = viewController
        presenter.interactor = UserProfileInteractor()
        presenter.router = UserProfileRouter()
        interactor.presenter = presenter
        
        return navigationController
    }

}
