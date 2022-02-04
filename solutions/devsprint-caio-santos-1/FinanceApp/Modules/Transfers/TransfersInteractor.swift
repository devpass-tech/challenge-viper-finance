//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
    
    func didFetchData()
    func didCreateTransfer(status: Bool)
}

final class TransfersInteractor: TransfersInteractorProtocol {
    
    weak var presenter: TransfersInteractorDelegate?
    
    func fetchData() {
        
        presenter?.didFetchData()
    }
    
    func createTransfer(value: Float) {
        if value <= 100.0 {
            presenter?.didCreateTransfer(status: true)
        } else {
            presenter?.didCreateTransfer(status: false)
        }
    }
}
