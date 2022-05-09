//
//  LoginInteractorTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 23/03/22.
//

import XCTest
@testable import FinanceApp

class LoginInteractorTests: XCTestCase {

    private var sut: LoginInteractor?
    private var outputSpy = LoginInteractorOutputSpy()
    
    override func setUpWithError() throws {
        sut = LoginInteractor(network: NetworkClient())
        sut?.output = outputSpy
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_authenticate_WithValidUser_ShouldBeSuccessful() throws {
        let sut = try XCTUnwrap(sut)
        let output = try XCTUnwrap(sut.output as? LoginInteractorOutputSpy)

        XCTAssertEqual(output.authenticationSuccessfulCalls, 0)
        XCTAssertEqual(output.authenticationFailedCalls, 0)
        sut.authenticate(email: "teste@teste.com", password: "1111")
        XCTAssertEqual(output.authenticationSuccessfulCalls, 1)
        XCTAssertEqual(output.authenticationFailedCalls, 0)
    }
    
    func test_authenticate_WithInvalidUser_ShouldReturnError() throws {
        let sut = try XCTUnwrap(sut)
        let output = try XCTUnwrap(sut.output as? LoginInteractorOutputSpy)

        XCTAssertEqual(output.authenticationSuccessfulCalls, 0)
        XCTAssertEqual(output.authenticationFailedCalls, 0)
        sut.authenticate(email: "caio@caio.com", password: "1111")
        XCTAssertEqual(output.authenticationSuccessfulCalls, 0)
        XCTAssertEqual(output.authenticationFailedCalls, 1)
    }
}

final class LoginInteractorOutputSpy: LoginInteractorOutputProtocol {
    private(set) var authenticationSuccessfulCalls = 0
    private(set) var authenticationFailedCalls = 0
    
    func authenticationSuccessful() {
        authenticationSuccessfulCalls += 1
    }
    
    func authenticationFailed() {
        authenticationFailedCalls += 1
    }
}
