//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import XCTest
@testable import ___VARIABLE_sdkName___

final class ___VARIABLE_moduleName___ConfiguratorTests: XCTestCase {
        
    private let sut = ___VARIABLE_moduleName___Configurator()

    func test_create_module() {
        let viewController = sut.createModule()
        XCTAssertTrue(viewController is ___VARIABLE_moduleName___ViewController)
    }
}
