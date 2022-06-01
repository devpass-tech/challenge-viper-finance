//
//  FinanceAppTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 30/12/21.
//

import XCTest
@testable import FinanceApp

final class FinanceAppTests: XCTestCase {
    
    private var sut: HomeViewController?
    private let presenterSpy = HomePresenterProtocolSpy()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewController()
        sut?.presenter = presenterSpy
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        sut?.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
        XCTAssertEqual(presenterSpy.viewDidLoadCountCalled, 1)
    }

}

final class HomePresenterProtocolSpy: HomePresenterProtocol {
    
    var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    private(set) var viewDidLoadCountCalled = 0
    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
        viewDidLoadCountCalled += 1
    }
    
    func openActivityDetails() {}

}
