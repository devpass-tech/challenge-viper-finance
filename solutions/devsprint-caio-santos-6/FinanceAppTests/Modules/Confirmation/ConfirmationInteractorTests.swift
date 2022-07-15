//
//  ConfirmationInteractorTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 14/07/22.
//

import XCTest
@testable import FinanceApp

class  ConfirmationInteractorTests: XCTestCase {

    var sut: ConfirmationInteractor!

    override func tearDown() {
        sut = nil
    }

    func test_niceButtonResponse() throws {
        sut = .init()
        
        let spy = ConfirmationInteractorDelegateSpy()
        sut.output = spy

        sut.tappedNice()

        //        XCTAssertEqual(spy.calledMethods, [.niceButtonResponse, .sample1, .sample2, .sample3])
        XCTAssertEqual(spy.calledMethods, [.niceButtonResponse, .niceButtonResponse])
    }
}

class ConfirmationInteractorDelegateSpy:  ConfirmationInteractorOutputProtocol {
    enum Methods {
        case niceButtonResponse
        case sample1
        case sample2
        case sample3
    }
    
    var calledMethods: [Methods] = []
    
    func niceButtonResponse() {
        calledMethods.append(.niceButtonResponse)
    }
    
    func sample1() {
        calledMethods.append(.sample1)
    }
    
    func sample2() {
        calledMethods.append(.sample2)
    }
    
    func sample3() {
        calledMethods.append(.sample3)
    }
}
