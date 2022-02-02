//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation

protocol TransfersPresenterDelegate: AnyObject {
     
    func showData()
}

final class TransfersPresenter: TransfersPresenterProtocol {
    
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    }
}

extension TransfersPresenter: TransfersInteractorDelegate {
    
    func didFetchData() {
        
        view?.showData()
    }
}
