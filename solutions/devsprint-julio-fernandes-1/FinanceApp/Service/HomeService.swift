//
//  HomeService.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 08/02/22.
//

import Foundation

protocol HomeService {
	func request(urlString: String, completion: @escaping (Result<HomeEntity, ServiceError>) -> Void)
}

struct HomeAPI: HomeService {
	
	func request(urlString: String, completion: @escaping (Result<HomeEntity, ServiceError>) -> Void) {
		guard let url = URL(string: urlString) else {
			return completion(.failure(.badRequest))
		}
		
		let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(.genericError(error.localizedDescription)))
			}
			
			if let response = response as? HTTPURLResponse,
				!((200...299).contains(response.statusCode)) {
				completion(.failure(.httpError(response.statusCode)))
			}
			
			guard let data = data else {
				return completion(.failure(.noData))
			}
			
			do {
				let result = try JSONDecoder().decode(HomeEntity.self, from: data)
				completion(.success(result))
			} catch let error {
				completion(.failure(.genericError(error.localizedDescription)))
			}
		}
		
		dataTask.resume()
	}
	
}
