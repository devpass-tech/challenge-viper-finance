//
//  TransfersPresenterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class TransfersPresenterTests: XCTestCase {
    private let interactorSpy = TransfersInteractorProtocolSpy()
    private let routerSpy = TransfersRouterProtocolSpy()
    private let viewContollerSpy = TransfersPresenterDelegateSpy()

    private lazy var sut = TransfersPresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_navigateToContactList() {
        sut.navigateToContactList()
        XCTAssertTrue(routerSpy.navigateToContactListCalled)
    }

    func test_navigateToConfirmation() {
        let confirmation = ConfirmationEntity(success: true, imageName: "image", message: "messa")
        sut.navigateToConfirmation(confirmation: confirmation)
        XCTAssertTrue(routerSpy.navigateToConfirmationCalled)
    }

    func test_didFetchData() {
        sut.didFetchData(transfer: TransfersEntity(success: true))
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }

    func test_didTapTransfer() {
        sut.didTapTransfer(value: "value")
        XCTAssertTrue(interactorSpy.transferCalled)
    }

}

final class TransfersInteractorProtocolSpy: TransfersInteractorProtocol {

    var presenter: TransfersInteractorDelegate?

    private(set) var transferCalled = false
    func transfer(value: String) {
        transferCalled = true
    }

}

final class TransfersRouterProtocolSpy: TransfersRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }

    private(set) var navigateToContactListCalled = false
    func navigateToContactList() {
        navigateToContactListCalled = true
    }

    private(set) var navigateToConfirmationCalled = false
    func navigateToConfirmation(confirmation: ConfirmationEntity) {
        navigateToConfirmationCalled = true
    }

}

final class TransfersPresenterDelegateSpy: TransfersPresenterDelegate {

    private(set) var showDataCalled = false
    func showData(transfer: TransfersEntity) {
        showDataCalled = true
    }

}
