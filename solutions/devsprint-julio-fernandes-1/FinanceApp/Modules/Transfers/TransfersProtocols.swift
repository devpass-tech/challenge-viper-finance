//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import UIKit

protocol TransfersPresenterProtocol {
	var view: TransfersPresenterDelegate? { get set }
	var interactor: TransfersInteractorProtocol { get set }
	var router: TransfersRouterProtocol { get set }
	
	func viewDidLoad()
}

protocol TransfersInteractorProtocol {
	var presenter: TransfersInteractorDelegate? { get set }
	func fetchData()
}


protocol TransfersRouterProtocol {
	static func createModule() -> UIViewController
	func navigateToContactList()
	func navigateToConfirmation()
}

