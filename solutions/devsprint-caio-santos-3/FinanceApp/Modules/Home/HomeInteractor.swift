//
//  HomeViewInteractor.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    
    func didFetchData()
}

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorDelegate?
        
    func fetchData() {
        presenter?.didFetchData()
    }
}
