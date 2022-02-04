//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import Foundation

protocol TransfersPresenterDelegate: AnyObject {

	 func showData()
}

final class TransfersPresenter: TransfersPresenterProtocol {
	
	weak var view: TransfersPresenterDelegate?
	var interactor: TransfersInteractorProtocol
	var router: TransfersRouterProtocol
	
	init(
		interactor: TransfersInteractorProtocol,
		router: TransfersRouterProtocol
	) {
		self.interactor = interactor
		self.router = router
	}
	
	func viewDidLoad() {
		interactor.fetchData()
	}
		
}

extension TransfersPresenter: TransfersInteractorDelegate {
	
	func didFetchData() {
		view?.showData()
	}
	
}
