//
//  ActivityDetailRepository.swift
//  FinanceApp
//
//  Created by Victor Catão on 18/03/22.
//

import Foundation

enum ActivityDetailError: Error {
    case invalidID
}

// MARK: - ActivityDetailRepositoryProtocol

protocol ActivityDetailRepositoryProtocol {
    func fetchActivityDetail(completion: @escaping (Activity?, ActivityDetailError?) -> Void)
}

// MARK: - ActivityDetailRepository

struct ActivityDetailRepository: ActivityDetailRepositoryProtocol {
    
    // MARK: Private Properties

    private let service: FinanceServiceProtocol
    
    // MARK: Init
    
    init(service: FinanceServiceProtocol = FinanceService()) {
        self.service = service
    }

    // MARK: Public Functions

    func fetchActivityDetail(completion: @escaping (Activity?, ActivityDetailError?) -> Void) {
        Task.init(priority: .background) {
            let result = await service.fetchActivityDetail()
            DispatchQueue.main.async {
                switch result {
                case .success(let activityDetail):
                    completion(activityDetail, nil)
                case .failure:
                    completion(nil, .invalidID)
                }
            }
        }
    }
}
