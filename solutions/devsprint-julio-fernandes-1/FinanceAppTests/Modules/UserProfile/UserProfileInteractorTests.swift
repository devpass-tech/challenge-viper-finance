//
//  UserProfileInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 01/02/22.
//

import XCTest
@testable import FinanceApp

final class UserProfileInteractorTests: XCTestCase {
    private let presenterSpy = UserProfileInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = UserProfileInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData_returned_sucess() {
        serviceSpy.requestResultToBeReturned = UserEntity(name: "name", phone: "", email: "", address: "", account: nil)
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

    func test_fetchData_returned_failure() {
        sut.fetchData()
        XCTAssertFalse(presenterSpy.didFetchDataCalled)
    }
}

final class UserProfileInteractorDelegateSpy: UserProfileInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(_ userProfile: UserEntity) {
        didFetchDataCalled = true
    }

}
