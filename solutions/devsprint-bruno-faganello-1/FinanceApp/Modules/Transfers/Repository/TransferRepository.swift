//
//  TransferRepository.swift
//  FinanceApp
//
//  Created by Ludimila da bela cruz on 24/03/22.
//

import Foundation

enum TransferError {
    case unknowedError
}

protocol TransferRepositoryProtocol {
    func fetchTransfer(success: ((Transfer) -> Void)?, failure: ((TransferError) -> Void)?)
}

struct TransferRepository: TransferRepositoryProtocol {
    
    private let service: TransferServiceProtocol
    
    init(service: TransferServiceProtocol = TransferService()){
        self.service = service
    }
    
    func fetchTransfer(success: ((Transfer) -> Void)?, failure: ((TransferError) -> Void)?) {
        Task.init(priority: .background) {
            let result = await service.fetchTransfer()
            DispatchQueue.main.async {
                switch result {
                    case let .success(transfer):
                        success?(transfer)
                    case .failure:
                        failure?(.unknowedError)
                }
            }
        }
    }
    
    
}
