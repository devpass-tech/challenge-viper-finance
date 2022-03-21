//
//  HomeRepository.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import Foundation

enum HomeError {
    case unknown
}

protocol HomeRepositoryProtocol {
    func fetchHomeData(completion: @escaping (HomeData?, HomeError?) -> Void)
}

struct HomeRepository: HomeRepositoryProtocol {
    
    private let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
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
