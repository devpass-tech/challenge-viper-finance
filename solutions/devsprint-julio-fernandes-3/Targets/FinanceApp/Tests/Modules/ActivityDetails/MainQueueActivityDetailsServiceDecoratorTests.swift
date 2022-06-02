//
//  MainQueueActivityDetailsServiceDecoratorTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class MainQueueActivityDetailsServiceDecoratorTests: XCTestCase {

    private let service = TempActivityDetailsServiceProtocolSpy()
    private var sut: MainQueueActivityDetailsServiceDecorator?
    private let dtoDummy = ActivityDetailsDTO(activityName: "", category: "", price: 20, time: Date(timeIntervalSince1970: 1654119091), imageName: "")
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainQueueActivityDetailsServiceDecorator(service)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetch()  {
        service.completionHandler = dtoDummy
        sut?.fetch { [weak self] dto in
            XCTAssertEqual(dto.price, self?.dtoDummy.price)
        }
        XCTAssertEqual(service.fetchCalled, 1)
    }

}
