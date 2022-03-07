//
//  ConfirmationViewControllerTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationViewControllerTests: XCTestCase {

    private let routerSpy = ConfirmationRouterProtocolSpy()
    private let confirmation = ConfirmationEntity(success: true, imageName: "image", message: "message")
    private lazy var presenterSpy = ConfirmationPresenterProtocolSpy(router: routerSpy, confirmation: confirmation)
    private lazy var sut = ConfirmationViewController(presenter: presenterSpy)

    override func setUp() {
        super.setUp()
        sut.presenter = presenterSpy
    }

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
        XCTAssertTrue(sut.view is ConfirmationView)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }

    func test_showData() {
        XCTAssertEqual(sut.confirmationView.loadingIndicator.isAnimating, true)

        let confirmation = ConfirmationEntity(success: true, imageName: "image", message: "message")
        sut.showData(confirmation: confirmation)

        XCTAssertEqual(sut.confirmationView.loadingIndicator.isAnimating, false)
    }
}

final class ConfirmationPresenterProtocolSpy: ConfirmationPresenterProtocol {

    var view: ConfirmationPresenterDelegate?
    var router: ConfirmationRouterProtocol
    var confirmation: ConfirmationEntity

    init(router: ConfirmationRouterProtocol, confirmation: ConfirmationEntity) {
        self.confirmation = confirmation
        self.router = router
    }

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}
