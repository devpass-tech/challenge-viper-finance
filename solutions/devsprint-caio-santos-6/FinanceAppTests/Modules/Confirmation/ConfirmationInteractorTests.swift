//
//  ConfirmationInteractorTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 14/07/22.
//

import XCTest
@testable import FinanceApp

class  ConfirmationInteractorTests: XCTestCase {

    var sut:  ConfirmationInteractor!

    override func tearDown() {
        sut = nil
    }
    
    func test_niceButtonResponse() throws {
        let spy = ConfirmationInteractorDelegateSpy()
        sut.output = spy
        
        sut.tappedNice()
        
        XCTAssertTrue(spy.niceButtonResponseCalled)
    }
}

class ConfirmationInteractorDelegateSpy:  ConfirmationInteractorOutputProtocol {
    var niceButtonResponseCalled: Bool = false
    func niceButtonResponse() {
        niceButtonResponseCalled = true
    }
}
