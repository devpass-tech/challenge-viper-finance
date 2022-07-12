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
    func doTransfer()
    func goToContactList()
}

protocol TransfersRouterProtocol {
    var viewController: UIViewController? { get set }
    
    static func makeTransfersController() -> UIViewController
    func navigateToContactList()
    func navigateToConfirmation()
}

protocol TransfersInteractorProtocol {
    var presenter: TransfersInteractorDelegate? { get set }
    
    func fetchData()
}


