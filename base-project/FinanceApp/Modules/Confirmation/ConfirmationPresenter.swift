//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ConfirmationPresenterDelegate: AnyObject {

}

class ConfirmationPresenter: ConfirmationPresenterProtocol {

    weak var view: ConfirmationPresenterDelegate?
    var interactor: ConfirmationInteractorProtocol?
    var router: ConfirmationRouterProtocol?
}

extension ConfirmationPresenter: ConfirmationInteractorDelegate {

}
