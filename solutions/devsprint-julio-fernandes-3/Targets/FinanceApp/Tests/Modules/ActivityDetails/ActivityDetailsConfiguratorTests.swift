//
//  ActivityDetailsConfiguratorTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 01/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import XCTest
@testable import FinanceApp

final class ActivityDetailsConfiguratorTests: XCTestCase {
    
    func test_createModule() throws {
    
        let view = ActivityDetailsConfigurator.createModule()
        XCTAssertTrue(view is ActivityDetailsViewController)
        
        let presenter = (view as? ActivityDetailsViewController)?.presenter
        XCTAssertTrue(presenter is ActivityDetailsPresenter)
        
        let router = presenter?.router
        XCTAssertTrue(router is ActivityDetailsRouter)
        
        let interactor = presenter?.interactor
        XCTAssertTrue(interactor is ActivityDetailsInteractor)
        
    }

}
