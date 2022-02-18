//
//  SampleV2Interactor.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

final class SampleV2Interactor {
    
    // MARK: - VIPER Properties
    
    weak var output: SampleV2InteractorOutputProtocol?

    // MARK: - Private Properties
    
    var jsonLoader: JsonLoaderProtocol

    // MARK: - Inits
    
    init(jsonLoader: JsonLoaderProtocol) {
        self.jsonLoader = jsonLoader
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension SampleV2Interactor: SampleV2InteractorInputProtocol {
    func loadSampleData() {
        if let data = jsonLoader.readLocalFile(forName: "sample") {
            do {
                let decodedData = try JSONDecoder().decode(SampleEntity.self, from: data)
                output?.didLoadSampleData(entity: decodedData)
            } catch {
                output?.didErrorOnLoadSampleData()
            }
        } else {
            output?.didErrorOnLoadSampleData()
        }
    }
}
