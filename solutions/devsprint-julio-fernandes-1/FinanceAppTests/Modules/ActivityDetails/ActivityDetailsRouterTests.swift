//
//  ActivityDetailsRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 07/02/22.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsRouterTests: XCTestCase {
    func test_createModule() {
        let sut = ActivityDetailsRouter.createModule()
        XCTAssertTrue(sut is ActivityDetailsViewController)
    }
}
