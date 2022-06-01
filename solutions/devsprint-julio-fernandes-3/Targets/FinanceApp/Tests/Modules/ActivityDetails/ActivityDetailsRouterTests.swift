//
//  ActivityDetailsRouterTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsRouterTests: XCTestCase {

    private let view = UIViewControllerMock()
    private var sut: ActivityDetailsRouter?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsRouter()
        sut?.view = view
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_presentReportIssue() {
        sut?.presentReportIssue()
        XCTAssertEqual(view.presentCalled, 1)
        XCTAssertTrue(view.viewControllerToBeReturned is UIAlertController)
    }

}

final class UIViewControllerMock: UIViewController {
    
    private(set) var presentCalled = 0
    private(set) var viewControllerToBeReturned: UIViewController?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCalled += 1
        viewControllerToBeReturned = viewControllerToPresent
    }
}
