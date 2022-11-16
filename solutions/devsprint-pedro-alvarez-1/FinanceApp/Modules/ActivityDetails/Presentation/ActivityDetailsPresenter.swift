//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import Foundation

protocol ActivityDetailsPresenterIntput {
    func fetchActivityDetails()
}

protocol ActivityDetailsPresenterOutput: AnyObject {
    func showActivityDetails(_ data: ActivityDetails)
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterIntput {
    private let interactor: ActivityDetailsInteractorInput
    private let router: ActivityDetailsRouterInput
    weak var view: ActivityDetailsPresenterOutput?
    
    init(interactor: ActivityDetailsInteractorInput,
         router: ActivityDetailsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchActivityDetails() {
        interactor.fetchDetails()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorOutput {
    func didFetchDetail(_ data: ActivityDetails) {
        view?.showActivityDetails(data)
    }
}
