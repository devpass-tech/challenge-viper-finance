//
//  ActivityDetailsViewControllerTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 07/02/22.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsViewControllerTests: XCTestCase {

    private let presenterSpy = ActivityDetailsPresenterProtocolSpy()
    private lazy var sut = ActivityDetailsViewController()

    override func setUp() {
        super.setUp()
        sut.presenter = presenterSpy
    }

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }
}

final class ActivityDetailsPresenterProtocolSpy: ActivityDetailsPresenterProtocol {

    var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }


}
