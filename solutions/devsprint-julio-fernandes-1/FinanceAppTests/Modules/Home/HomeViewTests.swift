//
//  HomeViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewTests: XCTestCase {

    private let homeViewDelegateSpy = HomeViewDelegateSpy()
    private let sut = HomeView()

    override func setUp() {
        super.setUp()
        sut.delegate = homeViewDelegateSpy
    }

    func test_didSelectedActivity() {
        sut.didSelectedActivity()
        XCTAssertTrue(homeViewDelegateSpy.didSelectActivityCalled)
    }
}

final class HomeViewDelegateSpy: HomeViewDelegate {

    private(set) var didSelectActivityCalled = false
    func didSelectActivity() {
        didSelectActivityCalled = true
    }

}
