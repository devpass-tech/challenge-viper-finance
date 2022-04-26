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
