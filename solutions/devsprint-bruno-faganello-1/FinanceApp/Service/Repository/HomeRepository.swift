//
//  HomeRepository.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import Foundation

// MARK: - HomeError

enum HomeError {
    case unknown
}

// MARK: - HomeRepositoryProtocol

protocol HomeRepositoryProtocol {
    func fetchHomeData(completion: @escaping (HomeData?, HomeError?) -> Void)
}

// MARK:  - HomeRepository

struct HomeRepository: HomeRepositoryProtocol {
    
    // MARK: Private Properties

    private let service: HomeServiceProtocol
    
    // MARK: Init

    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    // MARK: Public Methods

    func fetchHomeData(completion: @escaping (HomeData?, HomeError?) -> Void) {
        Task.init(priority: .background) {
            let result = await service.fetchHomeInformation()
            DispatchQueue.main.async {
                switch result {
                case .success(let homeInformation):
                    completion(homeInformation, nil)
                case .failure:
                    completion(nil, .unknown)
                }
            }
        }
    }
}
