//
//  ConfirmationViewControllerTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class ConfirmationViewControllerTests: XCTestCase {

    private let presenterSpy = ConfirmationPresenterProtocolSpy()
    private lazy var sut = ConfirmationViewController()

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
}

final class ConfirmationPresenterProtocolSpy: ConfirmationPresenterProtocol {

    var view: ConfirmationPresenterDelegate?
    var interactor: ConfirmationInteractorProtocol?
    var router: ConfirmationRouterProtocol?

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}

