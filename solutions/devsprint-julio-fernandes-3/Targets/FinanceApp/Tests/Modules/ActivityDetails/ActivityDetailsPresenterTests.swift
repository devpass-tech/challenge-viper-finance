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

    private let sut = ActivityDetailsPresenter()
    private let activityDetailsPresenterDelegatSpy = ActivityDetailsPresenterDelegateSpy()
    private let dtoDummy = ActivityDetailsDTO(
        activityName: "", category: "",
        price: 0,
        time: Date(),
        imageName: ""
    )
    
    override func setUp() {
        sut.view = activityDetailsPresenterDelegatSpy
    }
    
    func test_didFetch_shouldCallViewUpdate() throws {
        sut.didFetch(data: dtoDummy)
        
        XCTAssertTrue(activityDetailsPresenterDelegatSpy.didUpdateCalled)
    }

}

final class ActivityDetailsPresenterDelegateSpy: ActivityDetailsPresenterDelegate {
    
    private(set) var didUpdateCalled = false
    
    func update(viewModel: ActivityDetailsViewModel) {
        didUpdateCalled = true
    }
}
