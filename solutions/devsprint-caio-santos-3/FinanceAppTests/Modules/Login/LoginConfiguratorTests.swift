//
//  LoginConfiguratorTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 22/03/22.
//

import XCTest
@testable import FinanceApp

class LoginConfiguratorTests: XCTestCase {
    
    private var sut: LoginConfigurator?

    override func setUpWithError() throws {
        sut = LoginConfigurator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_CreateModule_ShouldConfigureAllClasses() throws {
        let sut = try XCTUnwrap(sut)

        let viewController = sut.createModule()
        
        XCTAssert(viewController is LoginViewController)
        
        let viewControllerMirrored = Mirror(reflecting: viewController)
        let presenter = try XCTUnwrap(viewControllerMirrored.firstChild(of: LoginPresenter.self))
        XCTAssertNotNil(presenter.viewController)

        let presenterMirrored = Mirror(reflecting: presenter)
        let router = try XCTUnwrap(presenterMirrored.firstChild(of: LoginRouter.self))
        XCTAssertNotNil(router)

        let interactor = try XCTUnwrap(presenterMirrored.firstChild(of: LoginInteractor.self))
        XCTAssertNotNil(interactor)

        let interactorMirrored = Mirror(reflecting: interactor)
        let network = try XCTUnwrap(interactorMirrored.firstChild(of: NetworkClient.self))
        XCTAssertNotNil(network)
    }
}
