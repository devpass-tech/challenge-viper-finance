//
//  HomeViewInteractor.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    
    func didFetchData(home: Home)
}

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorDelegate?
    
    private var service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }
    
    func fetchData() {
        service.load(endpoint: .home) { (response: Result<Home, FinanceServiceError>) in
    
        }
    }
}
