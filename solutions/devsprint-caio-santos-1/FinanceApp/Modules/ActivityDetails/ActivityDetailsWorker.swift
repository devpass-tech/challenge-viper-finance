//
//  ActivityDetailsWorker.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 10/02/22.
//

import Foundation

protocol ActivityDetailsWorkerProtocol {
    func fetchData(completion: @escaping (Result<ActivityDetailsEntity, ActivityDetailsWorker.ActivityDetailsWorkerError>) -> Void)
}

final class ActivityDetailsWorker {
    private let service: FinanceService
    
    init(service: FinanceService) {
        self.service = service
    }
    
    enum ActivityDetailsWorkerError: Error {
        case fetchDataError(String)
        case decodeError
    }
}

extension ActivityDetailsWorker: ActivityDetailsWorkerProtocol {
    func fetchData(completion: @escaping (Result<ActivityDetailsEntity, ActivityDetailsWorker.ActivityDetailsWorkerError>) -> Void) {
        do {
            guard let data = service.readLocalFile(forName: "activity_details_endpoint") else { return }
            let activityDetails = try JSONDecoder().decode(ActivityDetailsEntity.self, from: data)
            completion(.success(activityDetails))
        } catch {
            completion(.failure(ActivityDetailsWorkerError.decodeError))
        }
    }
}
