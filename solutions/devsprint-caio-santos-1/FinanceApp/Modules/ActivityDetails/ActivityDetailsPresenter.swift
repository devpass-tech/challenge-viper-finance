//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func showData()
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    func didFetchData() {
        view?.showData()
    }
}
