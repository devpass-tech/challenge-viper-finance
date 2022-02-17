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
        sut.navigateToConfirmation(confirmation: ConfirmationEntity(success: true, imageName: "imageName", message: "message"))
        XCTAssertTrue(viewControllerSpy.showDetailViewControllerCalled)
        XCTAssertTrue(viewControllerSpy.showDetailViewControllerPassed is ConfirmationViewController)
    }
}

final class ViewControllerSpy: UIViewController {

    private(set) var presentViewControllerCalled = false
    private(set) var presentViewControllerPassed: UIViewController?
    private(set) var presentViewControllerAnimatedPassed: Bool?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentViewControllerCalled = true
        presentViewControllerPassed = viewControllerToPresent
        presentViewControllerAnimatedPassed = flag
    }

    private(set) var showDetailViewControllerCalled = false
    private(set) var showDetailViewControllerPassed: UIViewController?
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        showDetailViewControllerCalled = true
        showDetailViewControllerPassed = vc
    }

}
