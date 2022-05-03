//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 28/04/22.
//

import Foundation

protocol ConfirmationInteractorDelegate: AnyObject {
    
    func didFetchData()
    
}

class ConfirmationInteractor: ConfirmationInteractorProtocol {
    
    weak var presenter: ConfirmationInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
}
