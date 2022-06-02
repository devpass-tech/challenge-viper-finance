//
//  ActivityDetailsInteractorTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsInteractorTests: XCTestCase {
    
    private var service = TempActivityDetailsServiceProtocolSpy()
    private let presenter = ActivityDetailsInteractorDelegateSpy()
    private var sut: ActivityDetailsInteractor?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsInteractor(service: service)
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchData() {
        service.completionHandler = ActivityDetailsDTO(activityName: "", category: "", price: 0, time: Date(), imageName: "")
        sut?.fetchData()
        XCTAssertEqual(service.fetchCalled, 1)
        XCTAssertEqual(presenter.didFetchCalled, 1)
    }

}

final class TempActivityDetailsServiceProtocolSpy: TempActivityDetailsServiceProtocol {
    
    private(set) var fetchCalled = 0
    var completionHandler: ActivityDetailsDTO?
    func fetch(completion: @escaping (ActivityDetailsDTO) -> Void) {
        fetchCalled += 1
        guard let completionHandler = completionHandler else { return }
        completion(completionHandler)
    }
    
}

final class ActivityDetailsInteractorDelegateSpy: ActivityDetailsInteractorDelegate {
    
    private(set) var didFetchCalled = 0
    func didFetch(data: ActivityDetailsDTO) {
        didFetchCalled += 1
    }
    
}
