//
//  ActivityDetailsViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsViewTests: XCTestCase {
    
    private var sut: ActivityDetailsView?
    private let viewModelMock = ActivityDetailsViewModel(activityName: "activityName", category: "category", price: "$20.00", time: "19:00 PM")

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityDetailsView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        sut?.update(viewModel: viewModelMock)
        XCTAssertEqual(sut?.activityNameLabel.text, viewModelMock.activityName)
        XCTAssertEqual(sut?.categoryLabel.text, viewModelMock.category)
        XCTAssertEqual(sut?.priceLabel.text, viewModelMock.price)
        XCTAssertEqual(sut?.timeLabel.text, viewModelMock.time)
    }

}
