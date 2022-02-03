//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import XCTest
@testable import ___VARIABLE_sdkName___

final class ___VARIABLE_moduleName___PresenterTests: XCTestCase {
    private lazy var sut = ___VARIABLE_moduleName___Presenter(router: routerSpy,
                                                              interactor: interactorSpy)
    private let interactorSpy = ___VARIABLE_moduleName___InteractorInputProtocolSpy()
    private let routerSpy = ___VARIABLE_moduleName___RouterProtocolSpy()
    private let viewContollerSpy = ___VARIABLE_moduleName___PresenterOutputProtocolSpy()

    override func setUp() {
        super.setUp()
        sut.viewController = viewContollerSpy
    }
}
