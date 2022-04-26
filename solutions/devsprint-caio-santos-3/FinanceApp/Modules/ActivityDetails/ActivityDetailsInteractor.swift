//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 26/04/22.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {

    func didFetchData()
    
}

class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        
        presenter?.didFetchData()
        
    }
}
