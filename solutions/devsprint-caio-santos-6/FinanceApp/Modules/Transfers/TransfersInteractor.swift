//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
    func didFetchData()
}

class TransfersInteractor: TransfersInteractorProtocol {
    weak var presenter: TransfersInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()        
    }
}
