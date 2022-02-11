//
//  TransfersInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class TransfersInteractorTests: XCTestCase {
    private let presenterSpy = TransfersInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = TransfersInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData_returned_sucess() {
        serviceSpy.requestResultToBeReturned = TransfersEntity(success: true)
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

    func test_fetchData_returned_failure() {
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didReceiveErrorCalled)
    }
}

final class TransfersInteractorDelegateSpy: TransfersInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(transfer: TransfersEntity) {
        didFetchDataCalled = true
    }

    private(set) var didReceiveErrorCalled = false
    func didReceiveError(error: Error) {
        didReceiveErrorCalled = true
    }

}
