//
//  TransferMock.swift
//  FinanceAppTests
//
//  Created by Ludimila da bela cruz on 25/03/22.
//

@testable import FinanceApp

class TransferMock {
    
    static func generateTransferModel() -> Transfer {
        return Transfer(success: true)
    }
}
