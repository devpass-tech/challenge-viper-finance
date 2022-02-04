//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation

protocol ConfirmationPresenterDelegate: AnyObject {
    
    func showData()
}

final class ConfirmationPresenter: ConfirmationPresenterProtocol {
    
    weak var view: ConfirmationPresenterDelegate?
    var interactor: ConfirmationInteractorProtocol?
    var router: ConfirmationRouterProtocol?
    var statusTransfer: Bool?
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    }
}

extension ConfirmationPresenter: ConfirmationInteractorDelegate {
    
    func didFetchData() {
        
        view?.showData()
    }
}
