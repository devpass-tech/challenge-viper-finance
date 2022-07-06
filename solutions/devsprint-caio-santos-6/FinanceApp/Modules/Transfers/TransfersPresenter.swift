//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import Foundation

protocol TransfersPresenterDelegate: AnyObject {
    func showDataOnView()
}


class TransfersPresenter: TransfersPresenterProtocol {
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
   
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchData() {
        view?.showDataOnView()
    }
}
