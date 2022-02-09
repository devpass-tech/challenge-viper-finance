//
//  TransfersRouterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class TransfersRouterTests: XCTestCase {

    private let navitationControllerSpy = UINavigationController()
    private let viewControllerSpy = ViewControllerSpy()
    private let sut = TransfersRouter()

    override func setUp() {
        super.setUp()
        navitationControllerSpy.viewControllers = [viewControllerSpy]
        sut.viewController = viewControllerSpy
    }

    func test_createModule() {
        let sut = TransfersRouter.createModule()
        XCTAssertTrue(sut is TransfersViewController)
    }

    func test_navigateToContactList() {
        sut.navigateToContactList()
        XCTAssertTrue(viewControllerSpy.presentViewControllerCalled)
        XCTAssertTrue(viewControllerSpy.presentViewControllerPassed is UINavigationController)
    }

    func test_navigateToConfirmation() {
        sut.navigateToConfirmation()
        XCTAssertTrue(viewControllerSpy.presentViewControllerCalled)
        XCTAssertTrue(viewControllerSpy.presentViewControllerPassed is ConfirmationViewController)
    }
}

final class ViewControllerSpy: UIViewController {

    public private(set) var presentViewControllerCalled = false
    public private(set) var presentViewControllerPassed: UIViewController?
    public private(set) var presentViewControllerAnimatedPassed: Bool?
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentViewControllerCalled = true
        presentViewControllerPassed = viewControllerToPresent
        presentViewControllerAnimatedPassed = flag
    }

}
