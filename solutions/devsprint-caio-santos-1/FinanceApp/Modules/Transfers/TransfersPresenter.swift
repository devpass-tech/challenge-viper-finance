//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

protocol TransfersPresenterDelegate: AnyObject {
     
    func showData()
    func didCreateTransfer(status: Bool)
}

final class TransfersPresenter: TransfersPresenterProtocol {

    weak var view: TransfersPresenterDelegate?
    var interactor: TransfersInteractorProtocol?
    var router: TransfersRouterProtocol?
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    }
    
    func navigateToContactList(navigationController: UINavigationController) {
        router?.navigateToContactList(navigationController: navigationController)
    }
    
    func navigateToConfirmation(navigationController: UINavigationController, isTransferSuccess: Bool) {
        router?.navigateToConfirmation(navigationController: navigationController, isTransferSuccess: isTransferSuccess)
    }
    
    func createTransfer(value: Float) {
        interactor?.createTransfer(value: value)
    }
}

extension TransfersPresenter: TransfersInteractorDelegate {
    func didCreateTransfer(status: Bool) {
        view?.didCreateTransfer(status: status)
    }
    
    func didFetchData() {
        
        view?.showData()
    }
}
