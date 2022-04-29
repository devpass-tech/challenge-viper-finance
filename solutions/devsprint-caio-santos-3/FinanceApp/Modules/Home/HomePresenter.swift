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
    func didFetchData() {
        view?.showData()
    }
}
