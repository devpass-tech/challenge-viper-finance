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
    
    func navigateToConfirmation(navigationController: UINavigationController) {
        router?.navigateToConfirmation(navigationController: navigationController)
    }
    
}

extension TransfersPresenter: TransfersInteractorDelegate {
    
    func didFetchData() {
        
        view?.showData()
    }
}
