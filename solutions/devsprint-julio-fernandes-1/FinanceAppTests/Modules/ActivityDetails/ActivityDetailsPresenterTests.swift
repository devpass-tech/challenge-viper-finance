//
//  ActivityDetailsPresenterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 07/02/22.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsPresenterTests: XCTestCase {

    private lazy var sut = ActivityDetailsPresenter()
    private let interactorSpy = ActivityDetailsInteractorProtocolSpy()
    private let viewContollerSpy = ActivityDetailsPresenterDelegateSpy()

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
        sut.interactor = interactorSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.fetchDataCalled)
    }

    func test_didFetchData() {
        sut.didFetchData()
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class ActivityDetailsInteractorProtocolSpy: ActivityDetailsInteractorProtocol {

    var presenter: ActivityDetailsInteractorDelegate?

    private(set) var fetchDataCalled = false
    func fetchData() {
        fetchDataCalled = true
    }

}

final class ActivityDetailsPresenterDelegateSpy: ActivityDetailsPresenterDelegate {
    private(set) var showDataCalled = false
    func showData() {
        showDataCalled = true
    }
}
