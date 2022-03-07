//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation


final class ConfirmationInteractor {
    
    // MARK: - VIPER Properties
    weak var output: ConfirmationInteractorOutputProtocol?
    
    // MARK: - Private Properties
    
    var jsonLoader: JsonLoaderProtocol
    
    // MARK: - Inits
    
    init(jsonLoader: JsonLoaderProtocol) {
        self.jsonLoader = jsonLoader
    }
    
    // MARK: - Internal Methods
    
    
    // MARK: - Private Methods
}

extension ConfirmationInteractor: ConfirmationInteractorInputProtocol {
    
}
