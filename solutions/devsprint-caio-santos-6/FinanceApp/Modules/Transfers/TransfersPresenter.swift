//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

protocol TransfersPresenterDelegate: AnyObject {
    func showDataOnView(transfer: Transfer)
}


class TransfersPresenter: TransfersPresenterProtocol {
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
    func viewDidLoad() {
//        interactor?.fetchData()
    }
    
    func goToContactList(navigation: UINavigationController) {
        router?.navigateToContactList(navigation: navigation)
    }
    
    func goToConfirmation(navigation: UINavigationController) {
        interactor?.fetchData()
        router?.navigateToConfirmation(navigation: navigation)
    }
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchData(transfer: Transfer) {
        view?.showDataOnView(transfer: transfer)
    }
}
