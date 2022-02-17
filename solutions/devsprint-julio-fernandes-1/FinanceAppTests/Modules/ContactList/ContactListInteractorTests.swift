//
//  ContactListInteractorTests.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 03/02/22.
//

import XCTest
@testable import FinanceApp

final class ContactListInteractorTests: XCTestCase {
    private let presenterSpy = ContactListInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = ContactListInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData_returned_success() {
        serviceSpy.requestResultToBeReturned = [ContactEntity(name: "", phone: "")]
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

    func test_fetchData_returned_error() {
        sut.fetchData()
        XCTAssertFalse(presenterSpy.didFetchDataCalled)
    }
}

final class ContactListInteractorDelegateSpy: ContactListInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(contactList: [ContactEntity]) {
        didFetchDataCalled = true
    }

}

final class FinanceServiceProtocolSpy: FinanceServiceProtocol {

    var requestResultToBeReturned: Any?

    func load<T>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let requestResultToBeReturned = requestResultToBeReturned as? T else {
            completion(.failure(ErrorSpy.generic))
            return
        }

        completion(.success(requestResultToBeReturned))
    }

    private(set) var cancelCalled = false
    func cancel() {
        cancelCalled = true
    }

}

enum ErrorSpy: Error {
    case generic
}
