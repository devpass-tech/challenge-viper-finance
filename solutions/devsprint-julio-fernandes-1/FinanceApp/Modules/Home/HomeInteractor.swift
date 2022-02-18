//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by Mateus Nazario on 09/02/22.
//

import Foundation

// MARK: Protocols
protocol HomeInteractorDelegate: AnyObject {
    func didFetchData()
}

// MARK: Class
final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
    
    func didFetchData() {
        presenter?.didFetchData()
    }
}
