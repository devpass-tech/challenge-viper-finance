//
//  HomeViewPresenter.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation
import UIKit

protocol HomePresenterDelegate: AnyObject {
    func showData(home: HomeDTO)
    func showError(message: String)
}

final class HomePresenter: HomePresenterProtocol {

    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    init(
        interactor: HomeInteractorProtocol,
        router: HomeRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    func presentUserProfile(){
        router.presentUserProfile()
    }
    
    func pushToActivityDetails() {
        router.pushToActivityDetails()
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didErrorData(error: FinanceServiceError) {
        view?.showError(message: error.localizedDescription)
    }
    
    func didFetchData(home: Home) {
        view?.showData(home: .init(balance: home.balance.toCurrency(),
                                   savings: home.savings.toCurrency(),
                                   spending: home.spending.toCurrency(),
                                   activity: home.activity.compactMap( { .init(name: $0.name,
                                                                               price: $0.price.toCurrency(),
                                                                               time: $0.time)
        })))
    }
}

struct HomeDTO {
    let balance, savings, spending: String
    let activity: [ActivityDTO]
    
    init(balance: String, savings: String, spending: String, activity: [ActivityDTO]) {
        self.balance = balance
        self.savings = savings
        self.spending = spending
        self.activity = activity
    }
}

struct ActivityDTO {
    let name, price, time: String
    
    internal init(name: String, price: String, time: String) {
        self.name = name
        self.price = price
        self.time = time
    }
}
