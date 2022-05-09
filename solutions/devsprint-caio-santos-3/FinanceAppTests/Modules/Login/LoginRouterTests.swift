//
//  LoginRouterTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 22/03/22.
//

import XCTest
@testable import FinanceApp

class LoginRouterTests: XCTestCase {

    private var sut: LoginRouter?
    
    override func setUpWithError() throws {
        sut = LoginRouter()
        configureSUT()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_showCreateAccountView_ShouldPushToCreateAccountController() throws {

    }
    
    func test_showHomeView_ShouldSetHomeViewControllerAsRoot() throws {

    }
    
    // MARK: - Private Methods
    
    private func configureSUT() {
        let viewController = UIViewController()
        let _ = UINavigationController(rootViewController: viewController)
        sut?.viewController = viewController
    }
    
}
