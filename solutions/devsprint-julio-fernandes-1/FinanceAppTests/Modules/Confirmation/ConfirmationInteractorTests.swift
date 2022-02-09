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
        executeRunLoop(extratime: 2.0)
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

}

extension XCTestCase {
    func executeRunLoop(extratime: TimeInterval) {
        RunLoop.current.run(until: Date() + extratime)
    }
}

final class ConfirmationInteractorDelegateSpy: ConfirmationInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(confirmation: ConfirmationEntity) {
        didFetchDataCalled = true
    }
}
