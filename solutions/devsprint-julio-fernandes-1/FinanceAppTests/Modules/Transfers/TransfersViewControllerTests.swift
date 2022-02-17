//
//  TransfersViewControllerTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class TransfersViewControllerTests: XCTestCase {
    private let presenterSpy = TransfersPresenterProtocolSpy()
    private lazy var sut = TransfersViewController(presenter: presenterSpy)

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }

    func test_didPressChooseContactButton() {
        sut.didPressChooseContactButton()
        XCTAssertTrue(presenterSpy.navigateToContactListCalled)
    }

    func test_didPressTransferButton() {
        sut.didPressTransferButton()
        XCTAssertTrue(presenterSpy.navigateToConfirmationCalled)
    }
}

final class TransfersPresenterProtocolSpy: TransfersPresenterProtocol {

    var view: TransfersPresenterDelegate?

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    private(set) var navigateToContactListCalled = false
    func navigateToContactList() {
        navigateToContactListCalled = true
    }

    private(set) var navigateToConfirmationCalled = false
    func navigateToConfirmation() {
        navigateToConfirmationCalled = true
    }


}
