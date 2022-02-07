//
//  ConfirmationInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationInteractorTests: XCTestCase {
    private let presenterSpy = ConfirmationInteractorDelegateSpy()
    private let sut = ConfirmationInteractor()

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData() {
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class ConfirmationInteractorDelegateSpy: ConfirmationInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }
}
