//
//  UserProfileViewControllerTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileViewControllerTests: XCTestCase {

    private let presenterSpy = UserProfilePresenterProtocolSpy(interactor: UserProfileInteractorProtocolSpy(),
                                                                    router: UserProfileRouterProtocolSpy())
    private lazy var sut = UserProfileViewController(presenter: presenterSpy)

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }
}

final class UserProfilePresenterProtocolSpy: UserProfilePresenterProtocol {

    var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol
    var router: UserProfileRouterProtocol

    init(interactor: UserProfileInteractorProtocol, router: UserProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}

final class UserProfileInteractorProtocolSpy: UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate?

    private(set) var fetchDataCalled = false
    func fetchData() {
        fetchDataCalled = true
    }

}

final class UserProfileRouterProtocolSpy: UserProfileRouterProtocol {

    static func createModule() -> UINavigationController {
        return UINavigationController()
    }

    private(set) var navigateToNewModuleCalled = false
    func navigateToNewModule() {
        navigateToNewModuleCalled = true
    }

}
