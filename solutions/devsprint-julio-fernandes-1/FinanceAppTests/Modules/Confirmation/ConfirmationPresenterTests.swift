//
//  ConfirmationPresenterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationPresenterTests: XCTestCase {

    private let interactorSpy = ConfirmationInteractorProtocolSpy()
    private let viewContollerSpy = ConfirmationPresenterDelegateSpy()
    private let routerSpy = ConfirmationRouterProtocolSpy()
    private lazy var sut = ConfirmationPresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.interactor = interactorSpy
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.fetchDataCalled)
    }

    func test_didFetchData() {
        let response = ConfirmationEntity(success: true, imageName: "imageName", message: "message")
        sut.didFetchData(confirmation: response)
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class ConfirmationPresenterDelegateSpy: ConfirmationPresenterDelegate {

    private(set) var showDataCalled = true
    func showData(confirmation: ConfirmationEntity) {
        showDataCalled = true
    }

}

final class ConfirmationInteractorProtocolSpy: ConfirmationInteractorProtocol {

    var presenter: ConfirmationInteractorDelegate?

    private(set) var fetchDataCalled = false
    func fetchData() {
        fetchDataCalled = true
    }

}

final class ConfirmationRouterProtocolSpy: ConfirmationRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}
