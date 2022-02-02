//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
    
    func didFetchData()
}

final class TransfersInteractor: TransfersInteractorProtocol {
    
    weak var presenter: TransfersInteractorDelegate?
    
    func fetchData() {
        
        presenter?.didFetchData()
    }
}
