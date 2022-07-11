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
        sut = .init(networkService: NetworkServiceMock())
        let mock = Transfer(success: true)
        var result = [Transfer?]()
        
        sut.networkService?.load(endpoint: .transfers, completion: { transfer in
            
        })
        
        XCTAssertEqual(result.first, mock)
    }
}

class NetworkServiceMock: FinanceServiceProtocol {
    func load<T>(endpoint: FinanceEndpoint,
                 completion: @escaping (Result<T, FinanceServiceError>) -> Void)
    where T : Decodable {
        
    }
  
}

