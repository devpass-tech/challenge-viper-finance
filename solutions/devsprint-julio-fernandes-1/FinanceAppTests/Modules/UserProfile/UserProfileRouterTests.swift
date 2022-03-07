//
//  UserProfileRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileRouterTests: XCTestCase {    

    func test_createModule() {
        let navigation = UserProfileRouter.createModule()
        XCTAssertEqual(navigation.viewControllers.count, 1)
        XCTAssertTrue(navigation.viewControllers.first is UserProfileViewController)
    }

}
