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
    private let sut = TransfersInteractor()

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData() {
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class TransfersInteractorDelegateSpy: TransfersInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }

}
