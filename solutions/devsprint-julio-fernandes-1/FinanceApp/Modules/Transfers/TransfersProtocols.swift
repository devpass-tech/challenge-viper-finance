//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 03/02/22.
//

import UIKit

protocol TransfersPresenterProtocol {
	var view: TransfersPresenterDelegate? { get set }
	
	func viewDidLoad()
	func navigateToContactList()
	func navigateToConfirmation()
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
