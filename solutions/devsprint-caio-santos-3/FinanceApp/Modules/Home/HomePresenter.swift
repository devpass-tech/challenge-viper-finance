//
//  HomeViewPresenter.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation
import UIKit

protocol HomePresenterDelegate: AnyObject {
    func showData()
    func showError(message: String)
}

final class HomePresenter: HomePresenterProtocol {
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    var homeDTO: HomeDTO?
    
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
    
    func getHomeData() -> HomeDTO? {
        return homeDTO
    }
    
    func getActivityData() -> [ActivityDTO]? {
        return homeDTO?.activity
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didErrorData(error: FinanceServiceError) {
        view?.showError(message: error.localizedDescription)
    }
    
    func didFetchData(_ home: Home) {
        homeDTO = HomeDTO(balance: home.balance.toBRLCurrency() ?? "",
                          savings: home.savings.toBRLCurrency() ?? "",
                          spending: home.spending.toBRLCurrency() ?? "",
                          activity: home.activity.compactMap({.init(name: $0.name, info: "\($0.price.toBRLCurrency() ?? "") • \($0.time)")}))
        view?.showData()
    }
}
