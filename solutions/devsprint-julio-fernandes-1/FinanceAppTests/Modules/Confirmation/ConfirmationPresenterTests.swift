//
//  ConfirmationPresenterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationPresenterTests: XCTestCase {

    private let viewContollerSpy = ConfirmationPresenterDelegateSpy()
    private let routerSpy = ConfirmationRouterProtocolSpy()
    private lazy var sut = ConfirmationPresenter(router: routerSpy,
                                                 confirmation: ConfirmationEntity(success: true, imageName: "image", message: "message"))

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class ConfirmationPresenterDelegateSpy: ConfirmationPresenterDelegate {

    private(set) var showDataCalled = true
    func showData(confirmation: ConfirmationEntity) {
        showDataCalled = true
    }

}

final class ConfirmationRouterProtocolSpy: ConfirmationRouterProtocol {

    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        return UIViewController()
    }

}
