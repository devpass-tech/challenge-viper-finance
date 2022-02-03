//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import XCTest
@testable import ___VARIABLE_sdkName___

final class ___VARIABLE_moduleName___InteractorTests: XCTestCase {
    private let presenterSpy = ___VARIABLE_moduleName___InteractorOutputProtocolSpy()
    private let sut = ___VARIABLE_moduleName___Interactor()

    override func setUp() {
        sut.output = presenterSpy
    }
}