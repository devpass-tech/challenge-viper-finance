//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation


final class TransfersInteractor {
    
    // MARK: - VIPER Properties
    weak var output: TransfersInteractorOutputProtocol?
    
    
    // MARK: - Private Properties
    
    var jsonLoader: JsonLoaderProtocol
    
    // MARK: - Inits
    
    init(jsonLoader: JsonLoaderProtocol) {
        self.jsonLoader = jsonLoader
    }
    
    // MARK: - Internal Methods
    
    
    // MARK: - Private Methods
}

extension TransfersInteractor: TransfersInteractorInputProtocol {
    func createTransfer(value: String) {
        if let data = jsonLoader.readLocalFile(forName: "transfer_successful_endpoint") {
            do {
                let decodedData = try JSONDecoder().decode(TransfersEntity.self, from: data)
                if decodedData.success {
                    output?.didCreateTransferSuccessful()
                } else {
                    output?.didErrorTransfer()
                }
            } catch {
                print(error)
                output?.didErrorTransfer()
            }
        } else {
            output?.didErrorTransfer()
        }
    }
}
