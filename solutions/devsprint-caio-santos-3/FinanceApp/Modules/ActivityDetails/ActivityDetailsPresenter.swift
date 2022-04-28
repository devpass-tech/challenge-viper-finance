//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 26/04/22.
//

import Foundation

protocol ActivityDetailsPresenterDelegate: AnyObject {
    
    func showData()
    
}

class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    private var interactor: ActivityDetailsInteractorProtocol?
    private var router: ActivityDetailsRouterProtocol?
    
    internal init(view: ActivityDetailsPresenterDelegate? = nil,
                  interactor: ActivityDetailsInteractorProtocol? = nil,
                  router: ActivityDetailsRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    
    func didFetchData() {

        view?.showData()
    }
}
