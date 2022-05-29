//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

// MARK: TransfersPresenterProtocol
protocol TransfersPresenterProtocol {
    var view: TransfersPresenterDelegate? { get set }
    var interactor: TransfersInteractorProtocol? { get set }
    var router: TransfersRouterProtocol? { get set }
    
    func openContactList()
    func openTransferConfirmation()
}

// MARK: TransfersPresenterDelegate
protocol TransfersPresenterDelegate: AnyObject {
    func showData()
}

// MARK: TransfersInteractorProtocol
protocol TransfersInteractorProtocol {
    var presenter: TransfersInteractorDelegate? { get set }
}

// MARK: TransfersInteractorDelegate
protocol TransfersInteractorDelegate: AnyObject {
    func didFetchData(transfer: Bool)
}

// MARK: TransfersConfiguratorProtocol
protocol TransfersConfiguratorProtocol {
    static func createModule() -> UIViewController
}

// MARK: TransfersRouterProtocol
protocol TransfersRouterProtocol {
    var view: UIViewController? { get set }
    func navigateToContactListModule()
    func navigateToConfirmationModule()
}
