//
//  UserProfileProtocols.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 01/02/22.
//

import UIKit

protocol UserProfilePresenterProtocol {
	var view: UserProfilePresenterDelegate? { get set }
	var interactor: UserProfileInteractorProtocol { get set }
	var router: UserProfileRouterProtocol { get set }
	
	func viewDidLoad()
}

protocol UserProfileRouterProtocol {
	static func createModule() -> UINavigationController
}

protocol UserProfileInteractorProtocol {
	var presenter: UserProfileInteractorDelegate? { get set }
	func fetchData()
}
