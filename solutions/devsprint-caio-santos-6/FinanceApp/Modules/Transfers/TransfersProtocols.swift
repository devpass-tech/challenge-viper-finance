//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import UIKit

protocol TransfersPresenterProtocol {
    var view: TransfersPresenterDelegate? { get set }
    var interactor: TransfersInteractorProtocol? { get set }
    var router: TransfersRouterProtocol? { get set }
    
    func viewDidLoad()
    func goToContactList(navigation: UINavigationController)
    func goToConfirmation(navigation: UINavigationController)
}

protocol TransfersRouterProtocol {
    static func makeTransfersController() -> UIViewController
    func navigateToContactList(navigation: UINavigationController)
    func navigateToConfirmation(navigation: UINavigationController)
}

protocol TransfersInteractorProtocol {
    var presenter: TransfersInteractorDelegate? { get set }
    func fetchData()
}


