//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation

protocol ConfirmationInteractorDelegate: AnyObject {
    
    func didFetchData()
}

final class ConfirmationInteractor: ConfirmationInteractorProtocol {
    
    weak var presenter: ConfirmationInteractorDelegate?
    
    func fetchData() {
        
        presenter?.didFetchData()
    }
}
