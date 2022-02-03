//
//  UserProfileInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileInteractorTests: XCTestCase {
    private let presenterSpy = UserProfileInteractorDelegateSpy()
    private let sut = UserProfileInteractor()

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData() {
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class UserProfileInteractorDelegateSpy: UserProfileInteractorDelegate {
    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }
}
