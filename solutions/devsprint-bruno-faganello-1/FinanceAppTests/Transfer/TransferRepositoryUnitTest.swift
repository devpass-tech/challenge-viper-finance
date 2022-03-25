//
//  TransferRepositoryUnitTest.swift
//  FinanceAppTests
//
//  Created by Ludimila da bela cruz on 24/03/22.
//

import XCTest

@testable import FinanceApp

class TransferRepositoryUnitTest: XCTestCase {
    
    var sut: TransferRepository!
    var service: TransferServiceMock!
    var transfer: Transfer!

    override func setUp() {
        super.setUp()
        
        sut = TransferRepository()
        service = TransferServiceMock()
        transfer = TransferMock.generateTransferModel()
    }

    func test_fetchTransfer_whenServiceResultHasSuccess_expectCompletionWithTransfer() {
        var resultModel: Transfer?
        let expectation = self.expectation(description: "fetching")

        sut.fetchTransfer(success: { result in
            resultModel = result
            expectation.fulfill()
        }, failure: nil)
        
        // run tests without breakpoints
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(self.transfer, resultModel)
    }
}
