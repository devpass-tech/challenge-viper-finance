//
//  UserProfileFactory.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import UIKit

enum UserProfileFactory {

    static func build() -> UIViewController {
        let interactor = UserProfileInteractor()
        let router = UserProfileRouter()
        let presenter = UserProfilePresenter(interactor: interactor, router: router)
        let view = UserProfileViewController(presenter: presenter)
        interactor.presenter = presenter
        router.view = view
        presenter.view = view
        return view
    }
}
