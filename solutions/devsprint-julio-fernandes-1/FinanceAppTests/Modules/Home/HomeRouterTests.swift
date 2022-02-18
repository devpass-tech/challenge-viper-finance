//
//  HomeRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class HomeRouterTests: XCTestCase {

    func test_createModule() {
        let sut = HomeRouter.createModule()
        XCTAssertTrue(sut is HomeViewController)
    }
}
