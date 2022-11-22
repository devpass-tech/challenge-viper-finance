//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import UIKit

protocol UserProfilePresenterInput {

}

protocol UserProfilePresenterOutput: AnyObject {

}

final class UserProfilePresenter: UserProfilePresenterInput {

    weak var view: UserProfilePresenterOutput?
    private let interactor: UserProfileInteractorInput
    private let router: UserProfileRouterInput

    init(interactor: UserProfileInteractorInput, router: UserProfileRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension UserProfilePresenter: UserProfileInteractorOutput {

}



