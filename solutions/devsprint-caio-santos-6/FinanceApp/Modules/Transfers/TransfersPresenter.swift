//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

protocol TransfersPresenterDelegate: AnyObject {
//    func showDataOnView()
    func showError()
}


class TransfersPresenter: TransfersPresenterProtocol {
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
    private var transfer: Transfer?
    
    func viewDidLoad() {

    }
    
    func doTransfer() {
        interactor?.fetchData()
    }
    
    func goToContactList() {
        router?.navigateToContactList()
    }
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchDataWithError() {
        view?.showError()
    }
    
    func didFetchData(transfer: Transfer) {
        self.transfer = transfer
//        view?.showDataOnView()
        router?.navigateToConfirmation()
    }
}
