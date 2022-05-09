//
//  LoginPresenterTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 24/03/22.
//

import XCTest
@testable import FinanceApp

class LoginPresenterTests: XCTestCase {

    private var sut: LoginPresenter?
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Authenticate_WithInvalidValues_ShouldCallAuthenticationFailed() throws {

    }
    
    func test_Authenticate_WithInvalidEmail_ShouldCallAuthenticationFailed() throws {

    }
    
    func test_Authenticate_WithInvalidPassword_ShouldCallAuthenticationFailed() throws {

    }
    
    func test_Authenticate_WithValidValues_ShouldShowHome() throws {

    }
    
    func test_Authenticate_WithInvalidUser_ShouldCallAuthenticationFailed() throws {

    }

    func test_createAccount_ShouldShowCreateAccountView() throws {

    }
}
