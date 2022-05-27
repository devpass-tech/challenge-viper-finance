//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class TransfersPresenter: TransfersPresenterProtocol {
    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
    // TODO: Implement methods TransfersPresenter, TransfersPresenterDelegate, integration TransfersPresenter with TransfersViewController and update protocol TransfersPresenterProtocol
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchData(transfer: Bool) {
        view?.showData()
    }
}
