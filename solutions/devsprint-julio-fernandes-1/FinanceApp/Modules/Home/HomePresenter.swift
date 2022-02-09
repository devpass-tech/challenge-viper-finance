//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by Mateus Nazario on 09/02/22.
//

import Foundation


// MARK: Protocol
protocol HomePresenterDelegate: AnyObject {
    func showData()
}

// MARK: Class
final class HomePresenter: HomePresenterProtocol {
    // MARK: Properties
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    // MARK: Init
    init(
        interactor: HomeInteractorProtocol,
        router: HomeRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.didFetchData()
    }
}

// MARK: Extensions
extension HomePresenter: HomeInteractorDelegate {
    func didFetchData() {
        view?.showData()
    }
}
