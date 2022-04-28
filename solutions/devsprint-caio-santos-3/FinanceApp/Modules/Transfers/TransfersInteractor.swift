//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Elena Diniz on 4/26/22.
//

import Foundation

protocol TransfersInteractoring {
    func fetchData()
}

class TransfersInteractor: TransfersInteractoring {
    
    func fetchData() {
        print("Caiu no Fetch Data")
    }
}
