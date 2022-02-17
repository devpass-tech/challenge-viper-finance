//
//  ConfirmationRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationRouterTests: XCTestCase {    

    func test_createModule() {
        let confirmation = ConfirmationEntity(success: true, imageName: "image", message: "message")
        let sut = ConfirmationRouter.createModule(confirmation: confirmation)
        XCTAssertNotNil(sut as? ConfirmationViewController)
    }
}
