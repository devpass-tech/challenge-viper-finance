//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

enum ServiceError: Error {
	case badRequest
	case errorGeneric(description: String)
	case notData
}

protocol FinanceServiceProtocol: AnyObject {

    func request<T: Decodable>(endpoint: String, completion: @escaping (Result<T, ServiceError>) -> Void)
}

class FinanceService: FinanceServiceProtocol {

    func request<T>(endpoint: String, completion: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
		 guard let url = URL(string: endpoint) else {
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
				 let result = try JSONDecoder().decode(T.self, from: data)
				 completion(.success(result))
			 } catch let error {
				 completion(.failure(.errorGeneric(description: error.localizedDescription)))
			 }
		 }
		 
		 dataTask.resume()
    }
}
