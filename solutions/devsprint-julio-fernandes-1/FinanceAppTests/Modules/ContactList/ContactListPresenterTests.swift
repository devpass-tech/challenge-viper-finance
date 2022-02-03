//
//  ContactListPresenterTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 03/02/22.
//

import XCTest
@testable import FinanceApp

final class ContactListPresenterTests: XCTestCase {

    private let interactorSpy = ContactListInteractorProtocolSpy()
    private let routerSpy = ContactListRouterProtocolSpy()
    private let viewContollerSpy = ContactListPresenterDelegateSpy()
    private lazy var sut = ContactListPresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
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

final class ContactListPresenterDelegateSpy: ContactListPresenterDelegate {

    private(set) var showDataCalled = false
    func showData() {
        showDataCalled = true
    }

}
