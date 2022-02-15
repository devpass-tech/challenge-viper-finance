//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import UIKit

protocol ActivityDetailsPresenterDelegate: AnyObject {
    
    func showData()
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol
    var router: ActivityDetailsRouterProtocol
    
    init(interactor: ActivityDetailsInteractorProtocol, router: ActivityDetailsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    
    func didFetchData() {
        view?.showData()
    }
}
