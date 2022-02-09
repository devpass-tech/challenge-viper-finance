//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import UIKit

protocol ContactListPresenterProtocol {
	var view: ContactListPresenterDelegate? { get set }
	var interactor: ContactListInteractorProtocol { get set }
	var router: ContactListRouterProtocol { get set }
	
	func viewDidLoad()
}

protocol ContactListRouterProtocol {
	static func createModule() -> UIViewController
}

protocol ContactListInteractorProtocol {
	var presenter: ContactListInteractorDelegate? { get set }
	func fetchData()
}
