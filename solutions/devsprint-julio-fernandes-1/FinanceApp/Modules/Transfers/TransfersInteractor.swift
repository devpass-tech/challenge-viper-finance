//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
	func didFetchData()
}

final class TransfersInteractor: TransfersInteractorProtocol {
	weak var presenter: TransfersInteractorDelegate?
	
	func fetchData() {
		presenter?.didFetchData()
	}
	
}
