//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 07/02/22.
//

import UIKit

protocol HomeRouterProtocol {
	static func createModule() -> UIViewController
	func navigationToUserProfile()
	func navigateToActivityDetails()
}
