//
//  HomeViewInteractor.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    
    func didFetchData(_ home: Home)
    func didErrorData(error: FinanceServiceError)
}

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorDelegate?
    
    private var service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }
    
    func fetchData() {
       service.load(endpoint: .home) { [weak self] (response: Result<Home, FinanceServiceError>) in
           guard let presenter = self?.presenter else {
               return
           }
           switch response {
           case .success(let success):
               presenter.didFetchData(success)
           case .failure(let failure):
               presenter.didErrorData(error: failure)
           }
       }
   }
}
