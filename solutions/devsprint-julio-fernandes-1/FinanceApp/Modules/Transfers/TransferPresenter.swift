//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import Foundation

protocol TransfersPresenterDelegate: AnyObject {
    func showData(transfer: TransfersEntity)
}

final class TransfersPresenter: TransfersPresenterProtocol {
	weak var view: TransfersPresenterDelegate?
	private var interactor: TransfersInteractorProtocol
	private var router: TransfersRouterProtocol
	
	init(
		interactor: TransfersInteractorProtocol,
		router: TransfersRouterProtocol
	) {
		self.interactor = interactor
		self.router = router
	}
	
    func didTapTransfer(value: String) {
		interactor.transfer(value: value)
	}
	
	func navigateToContactList() {
		router.navigateToContactList()
	}
	
	func navigateToConfirmation(confirmation: ConfirmationEntity) {
        router.navigateToConfirmation(confirmation: confirmation)
	}

}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didFetchData(transfer: TransfersEntity) {
        view?.showData(transfer: transfer)
    }
}
