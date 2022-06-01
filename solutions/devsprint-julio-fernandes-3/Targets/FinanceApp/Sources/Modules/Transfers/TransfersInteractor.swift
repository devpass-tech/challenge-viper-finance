//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class TransfersInteractor: TransfersInteractorProtocol {
    weak var presenter: TransfersInteractorDelegate?
    
    func transfer(value: String) {
        presenter?.didFetchData(transfer: TransfersEntity(success: true))
    }
}
