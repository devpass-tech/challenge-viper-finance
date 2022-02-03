//
//  ContactListRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 03/02/22.
//

import XCTest
@testable import FinanceApp

final class ContactListRouterTests: XCTestCase {    
    func test_createModule() {
        let navigation = ContactListRouter.createModule()
        XCTAssertEqual(navigation.viewControllers.count, 1)
        XCTAssertTrue(navigation.viewControllers.first is ContactListViewController)
    }
}
