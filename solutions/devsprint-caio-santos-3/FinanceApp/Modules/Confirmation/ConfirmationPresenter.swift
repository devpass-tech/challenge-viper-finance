//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 28/04/22.
//

import Foundation

protocol ConfirmationPresenterDelegate: AnyObject {
    
    func showData()
    
}

class ConfirmationPresenter: ConfirmationPresenterProtocol {
    
    weak var view: ConfirmationPresenterDelegate?
    private var interactor: ConfirmationInteractorProtocol?
    private var router: ConfirmationRouterProtocol?
    
    internal init(view: ConfirmationPresenterDelegate? = nil,
                  interactor: ConfirmationInteractorProtocol? = nil,
                  router: ConfirmationRouterProtocol? = nil) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
    
    
    func viewDidLoad() {
        
        interactor?.fetchData()
        
    }
}

extension ConfirmationPresenter: ConfirmationInteractorDelegate {
    
    func didFetchData() {
        
        view?.showData()
    
    }
}
