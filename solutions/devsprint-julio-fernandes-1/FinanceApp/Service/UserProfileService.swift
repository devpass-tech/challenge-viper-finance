//
//  UserProfileService.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 06/02/22.
//

import Foundation

enum FinanceError: Error {
	case badRequest
	case errorGeneric(description: String)
	case notData
}

protocol UserProfileService {
	func fetchUser(urlString: String, completion: @escaping (Result<UserEntity, FinanceError>) -> Void)
}

struct UserProfileAPI: UserProfileService {
	
	func fetchUser(urlString: String, completion: @escaping (Result<UserEntity, FinanceError>) -> Void) {
		guard let url = URL(string: urlString) else {
			return completion(.failure(.badRequest))
		}
		
		let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(.errorGeneric(description: error.localizedDescription)))
			}
			
			if let response = response as? HTTPURLResponse,
				!((200...299).contains(response.statusCode)) {
				completion(.failure(.errorGeneric(description: "\(response.statusCode)")))
			}
			
			guard let data = data else {
				return completion(.failure(.notData))
			}
			
			do {
				let result = try JSONDecoder().decode(UserEntity.self, from: data)
				completion(.success(result))
			} catch let error {
				completion(.failure(.errorGeneric(description: error.localizedDescription)))
			}
		}
		
		dataTask.resume()
	}

}
