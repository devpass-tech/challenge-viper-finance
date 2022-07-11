//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 05/07/22.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {
    func didFetchData(transfer: Transfer)
}

class TransfersInteractor: TransfersInteractorProtocol {
    var networkService: FinanceServiceProtocol?
    weak var presenter: TransfersInteractorDelegate?
    
    init (networkService: FinanceServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() {
        guard let networkService = networkService else { return }
        networkService.load(endpoint: .transfers) { [presenter] (response: Result<Transfer, FinanceServiceError>) in
            guard let presenter = presenter else {
                return
            }
            
            switch response {
            case .success(let transfer):
                presenter.didFetchData(transfer: transfer)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
