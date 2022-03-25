//
//  TransferService.swift
//  FinanceApp
//
//  Created by Ludimila da bela cruz on 24/03/22.
//

protocol TransferServiceProtocol {
    func fetchTransfer() async -> Result<Transfer, RequestError>
}

struct TransferService: TransferServiceProtocol, HTTPClient {
    func fetchTransfer() async -> Result<Transfer, RequestError> {
        return await sendRequest(endpoint: TransferEndpoint.transfer, responseModel: Transfer.self)
    }
    
    
    
}
