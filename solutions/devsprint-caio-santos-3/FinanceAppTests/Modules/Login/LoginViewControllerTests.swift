//
//  LoginViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 25/03/22.
//

import XCTest
@testable import FinanceApp

class LoginViewControllerTests: XCTestCase {

    private var sut: LoginViewController?

    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_CreateAccount_ShouldShowCreateAccountView() throws {

    }
    
    func test_Login_ShouldCallAuthenticateMethod() throws {

    }
    
    func test_authenticationFailed_ShouldShowWarningMessage() throws {

    }
}
