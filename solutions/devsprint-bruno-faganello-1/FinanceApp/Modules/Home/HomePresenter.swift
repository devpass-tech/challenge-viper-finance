//
//  HomoPresenter.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import Foundation

// MARK: - HomePresenterDelegate

protocol HomePresenterDelegate: AnyObject {
    func showError(message: String)
    func showData(homeData: HomeData)
}

// MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: Public Properties

    weak var view: HomePresenterDelegate?
    var interactor: HomeIteractorProtocol?
    var router: HomeRouterProtocol?
    
    // MARK: Private Properties

    func viewDidLoad() {
        interactor?.fetchData()
    }
}

// MARK: - HomeInteractorDelegate

extension HomePresenter: HomeInteractorDelegate {
    func didFailFetchHomeData(error: HomeError?) {
        guard let error = error else {
            view?.showError(message: "Unknown error.")
            return
        }
        switch error {
        case .unknown:
            view?.showError(message: "We can't fetch the data. Try again later.")
        }
    }
    
    func didFetchHomeData(_ homeData: HomeData) {
        view?.showData(homeData: homeData)
    }
}
