//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

protocol TransfersPresenterDelegate: AnyObject {
    func showDataOnView()
}


class TransfersPresenter: TransfersPresenterProtocol {
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func goToContactList(navigation: UINavigationController) {
        router?.navigateToContactList(navigation: navigation)
    }
    
    func goToConfirmation(navigation: UINavigationController) {
        router?.navigateToConfirmation(navigation: navigation)
    }
    
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchData() {
        view?.showDataOnView()
    }
}
