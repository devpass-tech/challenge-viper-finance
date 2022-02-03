//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
protocol ConfirmationPresenterDelegate: AnyObject {
    func showData(confirmation: Confirmation)
}

final class ConfirmationPresenter: ConfirmationPresenterProtocol {

    weak var view: ConfirmationPresenterDelegate?
    var interactor: ConfirmationInteractorProtocol
    var router: ConfirmationRouterProtocol

    init(interactor: ConfirmationInteractorProtocol, router: ConfirmationRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchData()
    }
}

extension ConfirmationPresenter: ConfirmationInteractorDelegate {

    func didFetchData(confirmation: Confirmation) {
        view?.showData(confirmation: confirmation)
    }
}
