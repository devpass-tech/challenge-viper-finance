//
//  TransfersInteractorTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 11/07/22.
//

import XCTest
@testable import FinanceApp

class TransfersInteractorTests: XCTestCase {

    var sut: TransfersInteractor!

    override func tearDown() {
        sut = nil
    }
    
    func test_fetchData_withValidResponse_shouldReturnTransfer() throws {
        sut = .init(networkService: NetworkServiceMock()) // <<<< withValidResponse
        let spy = TransfersInteractorDelegateSpy()
        sut.presenter = spy
//        let mock = Transfer(success: true)
//        var result = [Transfer?]()
        
//        sut.networkService?.load(endpoint: .transfers, completion: { transfer in
//            
//        })
        
        sut.fetchData()
        
        XCTAssertTrue(spy.didFetchDataCalled)
    }
}

class TransfersInteractorDelegateSpy: TransfersInteractorDelegate {
    var didFetchDataCalled = false
    var didFetchDataWithErrorCalled = false

    func didFetchData(transfer: Transfer) {
        didFetchDataCalled = true
    }
    
    func didFetchDataWithError() {
        didFetchDataWithErrorCalled = true
    }
}

class NetworkServiceMock: FinanceServiceProtocol {
    var isError = false
    
    func load<T>(endpoint: FinanceEndpoint,
                 completion: @escaping (Result<T, FinanceServiceError>) -> Void)
    where T : Decodable {
        guard let data = Transfer(success: true) as? T else { return }
        
        completion(.success(data))
    }
}

