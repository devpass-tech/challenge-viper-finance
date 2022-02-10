//
//  UserProfileWorker.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 08/02/22.
//

import Foundation

protocol UserProfileLogic {
    func fetchUserProfile(completion: @escaping (Result<UserProfileEntity, UserProfileWorker.UserProfileWorkerError>) -> Void)
}

final class UserProfileWorker {
    private let service: FinanceService
    
    init(service: FinanceService) {
        self.service = service
    }
    
    enum UserProfileWorkerError: Error {
        case fetchUserProfileError(String)
        case decodeError
    }
}

extension UserProfileWorker: UserProfileLogic {
    func fetchUserProfile(completion: @escaping (Result<UserProfileEntity, UserProfileWorkerError>) -> Void) {
        do {
            guard let data = service.readLocalFile(forName: "user_profile_endpoint") else { return }
            let userProfile = try JSONDecoder().decode(UserProfileEntity.self, from: data)
            completion(.success(userProfile))
        } catch {
            completion(.failure(UserProfileWorkerError.decodeError))
        }
    }
}
