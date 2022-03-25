//
//  TransferServiceMock.swift
//  FinanceAppTests
//
//  Created by Ludimila da bela cruz on 25/03/22.
//

@testable import FinanceApp

class TransferServiceMock: TransferServiceProtocol {

    var transfer = Transfer(success: true)

    func fetchTransfer() async -> Result<Transfer, RequestError> {
        return .success(transfer)
    }

}
