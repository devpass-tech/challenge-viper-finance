//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import Foundation

// MARK: - ActivityDetailsPresenterDelegate

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func showData(_ activity: Activity)
    func showError(message: String)
}

// MARK: - ActivityDetailsPresenter

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    // MARK: Public Properties

    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    // MARK: Public Methods

    func viewDidLoad() {
        interactor?.fetchData()
    }
}

// MARK: - ActivityDetailsInteractorDelegate

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    func didFailFetchActivity(error: ActivityDetailError?) {
        guard let error = error else {
            view?.showError(message: "Unknown error.")
            return
        }
        switch error {
        case .invalidID:
            view?.showError(message: "Invalid ID for Activity.")
        }
    }
    
    func didFetchActivity(_ activity: Activity) {
        view?.showData(activity)
    }
}
