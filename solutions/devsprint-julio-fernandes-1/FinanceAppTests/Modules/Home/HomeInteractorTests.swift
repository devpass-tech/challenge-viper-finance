//
//  HomeInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class HomeInteractorTests: XCTestCase {
    private let presenterSpy = HomeInteractorDelegateSpy()
    private let sut = HomeInteractor()

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_didFetchData() {
        sut.didFetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class HomeInteractorDelegateSpy: HomeInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }

}
