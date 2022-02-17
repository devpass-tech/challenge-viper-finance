//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

final class TransfersPresenter {
    
    // MARK: - VIPER Properties
    
    weak var viewController: TransfersViewController?
    private let router: TransfersRouterProtocol
    private let interactor: TransfersInteractorInputProtocol
    
    // MARK: Internal Properties
    
    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(router: TransfersRouterProtocol,
         interactor: TransfersInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
}

extension TransfersPresenter: TransfersPresenterInputProtocol {
    func navigateToContactView() {
        router.navigateToContactList()
    }
    
    func createTransfer(value: String) {
        interactor.createTransfer(value: value)
    }
    
    
}

extension TransfersPresenter: TransfersInteractorOutputProtocol {
    func didCreateTransferSuccessful() {
        router.navigateToConfirmation(isTransferSuccess: true)
    }
    
    func didErrorTransfer() {
        router.navigateToConfirmation(isTransferSuccess: false)
    }
}


// MARK: - Analytics
extension TransfersPresenter {
    func tackScreenView() {
        // TODO: CALL YOUR OWN VIEW TRACKER
    }
}
