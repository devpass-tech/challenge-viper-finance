//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol UserProfilePresenterDelegate: AnyObject {

}

class UserProfilePresenter: UserProfilePresenterProtocol {

    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?
}

extension UserProfilePresenter: UserProfileInteractorDelegate {

}
