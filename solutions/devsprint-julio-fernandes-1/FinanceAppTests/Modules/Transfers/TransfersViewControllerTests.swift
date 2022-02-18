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
        XCTAssertTrue(sut.view is TransfersView)
    }

    func test_didPressChooseContactButton() {
        sut.didPressChooseContactButton()
        XCTAssertTrue(presenterSpy.navigateToContactListCalled)
    }

    func test_didPressTransferButton() {
        sut.didPressTransferButton()
        XCTAssertTrue(presenterSpy.didTapTransferCalled)
    }

    func test_didAmountChange() {
        XCTAssertEqual(sut.transferValue, "")
        sut.didAmountChange(value: "value")
        XCTAssertEqual(sut.transferValue, "value")
    }

    func test_showData_with_transfer_true() {
        sut.showData(transfer: TransfersEntity(success: true))
        XCTAssertTrue(presenterSpy.navigateToConfirmationCalled)
    }

    func test_showData_with_transfer_false() {
        sut.showData(transfer: TransfersEntity(success: false))
        XCTAssertTrue(presenterSpy.navigateToConfirmationCalled)
    }

}

final class TransfersPresenterProtocolSpy: TransfersPresenterProtocol, TransferViewDelegate {

    var view: TransfersPresenterDelegate?

    private(set) var navigateToContactListCalled = false
    func navigateToContactList() {
        navigateToContactListCalled = true
    }

    private(set) var navigateToConfirmationCalled = false
    func navigateToConfirmation(confirmation: ConfirmationEntity) {
        navigateToConfirmationCalled = true
    }

    private(set) var didTapTransferCalled = false
    func didTapTransfer(value: String) {
        didTapTransferCalled = true
    }

    private(set) var didPressChooseContactButtonCalled = false
    func didPressChooseContactButton() {
        didPressChooseContactButtonCalled = true
    }

    private(set) var didPressTransferButtonCalled = false
    func didPressTransferButton() {
        didPressTransferButtonCalled = true
    }

    private(set) var didAmountChangeCalled = false
    func didAmountChange(value: String) {
        didAmountChangeCalled = true
    }

}
