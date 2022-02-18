//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
protocol ConfirmationPresenterDelegate: AnyObject {
    func showData(confirmation: ConfirmationEntity)
}

final class ConfirmationPresenter: ConfirmationPresenterProtocol {

    weak var view: ConfirmationPresenterDelegate?
    var router: ConfirmationRouterProtocol
    var confirmation: ConfirmationEntity

    init(router: ConfirmationRouterProtocol, confirmation: ConfirmationEntity) {
        self.router = router
        self.confirmation = confirmation
    }

    func viewDidLoad() {
        view?.showData(confirmation: confirmation)
    }
}
