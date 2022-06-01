//
//  ActivityDetailsViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsViewControllerTests: XCTestCase {
    
    private var sut: ActivityDetailsViewController?
    private var view = ActivityDetailsViewSpy()
    private let presenter = ActivityDetailsPresenterProtocolSpy()
    private let viewModelMock = ActivityDetailsViewModel(activityName: "activityName", category: "category", price: "$20.00", time: "19:00 PM")

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsViewController(activityDetailsView: view)
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initializer() {
        let sut = ActivityDetailsViewController(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func test_loadView()  {
        sut?.loadView()
        XCTAssertTrue(sut?.view is ActivityDetailsViewSpy)
    }
    
    func test_viewDidLoad() {
        sut?.viewDidLoad()
        XCTAssertEqual(presenter.viewDidLoadCalled, 1)
    }
    
    func test_update() {
        sut?.update(viewModel: viewModelMock)
        XCTAssertEqual(view.updateCalled, 1)
    }
    
    func test_didPressReportIssueButton() {
        sut?.didPressReportIssueButton()
        XCTAssertEqual(presenter.presentReportIssueCalled, 1)
    }
}

final class ActivityDetailsPresenterProtocolSpy: ActivityDetailsPresenterProtocol {
    
    var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    private(set) var viewDidLoadCalled = 0
    func viewDidLoad() {
        viewDidLoadCalled += 1
    }
    
    private(set) var presentReportIssueCalled = 0
    func presentReportIssue() {
        presentReportIssueCalled += 1
    }
    
}

final class ActivityDetailsViewSpy: UIView, ActivityDetailsViewProtocol {
    var delegate: ActivityDetailsViewDelegate?
    
    private(set) var updateCalled = 0
    func update(viewModel: ActivityDetailsViewModel) {
        updateCalled += 1
    }
    
}
