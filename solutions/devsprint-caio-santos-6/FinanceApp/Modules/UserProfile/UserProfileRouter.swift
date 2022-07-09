//
//  UserProfileRouter.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/07/22.
//

import Foundation
import UIKit

class UserProfileRouter: UserProfileRouterProtocol {

    static func createModule() -> UIViewController {
        let viewController = UserProfileViewController()
        let presenter = UserProfilePresenter()
        let interactor = UserProfileInteractor(service: FinanceService())
        
        presenter.view = viewController
        presenter.router = UserProfileRouter()
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        viewController.presenter = presenter
        
        return viewController
    }
}

