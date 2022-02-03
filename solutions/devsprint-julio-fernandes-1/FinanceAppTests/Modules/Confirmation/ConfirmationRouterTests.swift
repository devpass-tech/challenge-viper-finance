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
        let navigation = ConfirmationRouter.createModule()
        let controller: ConfirmationViewController? = navigation.viewControllers.first as? ConfirmationViewController
        let presenter: ConfirmationPresenterProtocol? = controller?.presenter
        let interactor: ConfirmationInteractorProtocol? = controller?.presenter?.interactor

        XCTAssertEqual(navigation.viewControllers.count, 1)
        XCTAssertNotNil(controller)
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(interactor)
    }
}
