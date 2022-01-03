//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ActivityDetailsPresenterDelegate: AnyObject {

}

class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {

    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {

}
