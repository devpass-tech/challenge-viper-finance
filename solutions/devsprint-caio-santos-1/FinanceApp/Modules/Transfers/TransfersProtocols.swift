//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

protocol TransfersPresenterProtocol {
    
    var view: TransfersPresenterDelegate? { get set }
    var interactor: TransfersInteractorProtocol? { get set }
    var router: TransfersRouterProtocol? { get set }
    
    func viewDidLoad()
    func navigateToContactList(navigationController: UINavigationController)
    func navigateToConfirmation(navigationController: UINavigationController)
}

protocol TransfersRouterProtocol {
    
    static func createModule() -> UINavigationController
    func navigateToContactList(navigationController: UINavigationController)
    func navigateToConfirmation(navigationController: UINavigationController)
}

protocol TransfersInteractorProtocol {
    
    var presenter: TransfersInteractorDelegate? { get set }
    func fetchData()
}
