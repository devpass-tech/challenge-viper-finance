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
}

protocol TransfersRouterProtocol {
    static func makeTransfersController() -> UIViewController
}

protocol TransfersInteractorProtocol {
    var presenter: TransfersInteractorDelegate? { get set }
    func fetchData()
}


