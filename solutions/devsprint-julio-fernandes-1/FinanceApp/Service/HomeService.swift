//
//  HomeService.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 08/02/22.
//

import Foundation

protocol HomeService {
	func load(urlString: String, completion: @escaping (Result<HomeEntity, NSError>) -> Void)
}

struct HomeAPI: HomeService {
	
	func load(urlString: String, completion: @escaping (Result<HomeEntity, NSError>) -> Void) {
		guard let url = URL(string: urlString) else {
			return completion(.failure(NSError(domain: "Error URL", code: 0)))
		}
		
		let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(NSError(domain: error.localizedDescription, code: 0)))
			}
			
			if let response = response as? HTTPURLResponse,
				!((200...299).contains(response.statusCode)) {
				completion(.failure(NSError(domain: "Error Http status-code", code: response.statusCode)))
			}
			
			guard let data = data else {
				return completion(.failure(NSError(domain: "No Data", code: 0)))
			}
			
			do {
				let result = try JSONDecoder().decode(HomeEntity.self, from: data)
				completion(.success(result))
			} catch let error {
				completion(.failure(NSError(domain: error.localizedDescription, code: 0)))
			}
		}
		
		dataTask.resume()
	}
	
}
