//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 07/02/22.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
	
	static func createModule() -> UIViewController {
		let viewController = HomeViewController()
		
		return viewController
	}
	
	func navigationToUserProfile() { }
	
	func navigateToActivityDetails() { }
	
}
