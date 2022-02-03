//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import XCTest
@testable import ___VARIABLE_sdkName___

final class ___VARIABLE_moduleName___ViewControllerTests: XCTestCase {
    private let presenterSpy = ___VARIABLE_moduleName___PresenterInputProtocolSpy()
    private lazy var sut = ___VARIABLE_moduleName___ViewController(presenter: presenterSpy)

    override func setUp() {
        super.setUp()
        UIApplication.shared.keyWindow?.rootViewController = sut
    }

    func test_viewDidLoad() {
        
    }
}