//
//  ActivityDetailsPresenterTests.swift
//  FinanceAppTests
//
//  Created by Mobills on 28/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsPresenterTests: XCTestCase {

    private var sut: ActivityDetailsPresenter?
    private let view = ActivityDetailsPresenterDelegateSpy()
    private let interactor = ActivityDetailsInteractorProtocolSpy()
    private let router = ActivityDetailsRouterProtocolSpy()
    private let dtoDummy = ActivityDetailsDTO(activityName: "", category: "", price: 20, time: Date(timeIntervalSince1970: 1654119091), imageName: "")
    
    override func setUp() {
        super.setUp()
        sut = ActivityDetailsPresenter()
        sut?.view = view
        sut?.interactor = interactor
        sut?.router = router
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut?.viewDidLoad()
        XCTAssertEqual(interactor.fetchDataCalled, 1)
    }
    
    func test_presentReportIssue() {
        sut?.presentReportIssue()
        XCTAssertEqual(router.presentReportIssueCalled, 1)
    }
    
    func test_didFetch_shouldCallViewUpdate() {
        sut?.didFetch(data: dtoDummy)
        XCTAssertEqual(view.updateCalled, 1)
        XCTAssertEqual(view.viewModelToBeReturned?.price, "$20.00")
        XCTAssertEqual(view.viewModelToBeReturned?.time, "06:31 PM")
    }

}


final class ActivityDetailsPresenterDelegateSpy: ActivityDetailsPresenterDelegate {
    
    private(set) var updateCalled = 0
    private(set) var viewModelToBeReturned: ActivityDetailsViewModel?
    func update(viewModel: ActivityDetailsViewModel) {
        updateCalled += 1
        viewModelToBeReturned = viewModel
    }
}

final class ActivityDetailsInteractorProtocolSpy: ActivityDetailsInteractorProtocol {
    var presenter: ActivityDetailsInteractorDelegate?
    
    private(set) var fetchDataCalled = 0
    func fetchData() {
        fetchDataCalled += 1
    }
    
}

final class ActivityDetailsRouterProtocolSpy: ActivityDetailsRouterProtocol {
    var view: UIViewController?
    
    private(set) var presentReportIssueCalled = 0
    func presentReportIssue() {
        presentReportIssueCalled += 1
    }
    
}
