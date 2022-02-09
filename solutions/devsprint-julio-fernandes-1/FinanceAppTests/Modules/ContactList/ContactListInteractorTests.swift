//
//  ContactListInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 03/02/22.
//

import XCTest
@testable import FinanceApp

//final class ContactListInteractorTests: XCTestCase {
//    private let presenterSpy = ContactListInteractorDelegateSpy()
//    private let sut = ContactListInteractor(service: FinanceServiceProtocolSpy())
//
//    override func setUp() {
//        sut.presenter = presenterSpy
//    }
//
//    func test_fetchData() {
//        sut.fetchData()
//        XCTAssertTrue(presenterSpy.didFetchDataCalled)
//    }
//}
//
//final class ContactListInteractorDelegateSpy: ContactListInteractorDelegate {
//
//    private(set) var didFetchDataCalled = false
//    func didFetchData(contactList: [ContactEntity]) {
//        didFetchDataCalled = true
//    }
//
//    private(set) var didReceiveErrorCalled = false
//    func didReceiveError(error: Error) {
//        didReceiveErrorCalled = true
//    }
//
//}
//
//final class FinanceServiceProtocolStub: FinanceServiceProtocol {
//
//    func load<T>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {}
//
//    func cancel() {}
//}
