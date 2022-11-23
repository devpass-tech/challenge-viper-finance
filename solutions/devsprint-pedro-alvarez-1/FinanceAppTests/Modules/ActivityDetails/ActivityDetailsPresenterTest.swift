//
//  ActivityDetailsPresenterTest.swift
//  FinanceAppTests
//
//  Created by Junior Fernandes on 18/11/22.
//

@testable import FinanceApp

import XCTest

final class ActivityDetailsPresenterTest: XCTestCase {
    private var sut: ActivityDetailsPresenter?
    private var mock = ActivityDetailsInteractorMock()
    private var spy = ActivityDetailsViewSpy()
    
    override func setUp() {
        sut = ActivityDetailsPresenter(
            interactor: mock,
            router: ActivityDetailsRouterSpy()
        )
        
        mock.presenter = sut
        sut?.view = spy
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_viewDidLoad_shouldCallUpdateView() {
        // given
        mock.context = .succes
        
        //when
        sut?.viewDidLoad()
        
        //then
        XCTAssertEqual(spy.updateViewCallsCount, 1)
        XCTAssertEqual(sut?.viewModel, .stub)
    }
}

class ActivityDetailsViewSpy: ActivityDetailsPresenterOutput {
    private(set) var updateViewCallsCount = 0
    
    func updateView() {
        updateViewCallsCount += 1
    }
}

class ActivityDetailsRouterSpy: ActivityDetailsRouterInput {
    func createModule() -> FinanceApp.ActivityDetailsViewController {
        return ActivityDetailsFactory.build()
    }
}

class ActivityDetailsInteractorMock: ActivityDetailsInteractorInput  {
    enum Context {
        case succes
        case failure
    }
    
    var context: Context?
    weak var presenter: ActivityDetailsInteractorOutput?
    
    func fetchDetails() {
        guard let context else { return }

        switch context {
        case .succes:
            presenter?.didFetchDetail(.stub)
        case .failure:
            break
        }
    }
}
