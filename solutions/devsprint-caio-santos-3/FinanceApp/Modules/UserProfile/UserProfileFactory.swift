//
//  UserProfileFactory.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import UIKit

struct UserProfileFactory: ModuleFactory {

    func createModule() -> UIViewController {
        var presenter: UserProfilePresentable = UserProfilePresenter()
        let interactor = UserProfileInteractor()
        let viewController = UserProfileViewController(presenter: presenter)
        
        presenter.view = viewController
        presenter.interactor = UserProfileInteractor()
        interactor.presenter = presenter
        return viewController
    }

}
