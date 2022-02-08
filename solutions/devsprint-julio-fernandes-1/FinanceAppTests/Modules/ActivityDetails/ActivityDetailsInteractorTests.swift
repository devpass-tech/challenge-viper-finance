//
//  ActivityDetailsInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 07/02/22.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsInteractorTests: XCTestCase {
    private let presenterSpy = ActivityDetailsInteractorDelegateSpy()
    private let sut = ActivityDetailsInteractor()

    override func setUp() {
        super.setUp()
        sut.presenter = presenterSpy
    }

    func test_fetchData() {
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class ActivityDetailsInteractorDelegateSpy: ActivityDetailsInteractorDelegate {
    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }
}
