//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

enum FinanceEndpoint: String {
    case userProfile = "user_profile_endpoint"
    case contactList = "contact_list_endpoint"
    case home = "home_endpoint"
}

enum FinanceServiceError: Error {
    case invalidURL
    case errorGeneric(description: String)
    case invalidResponse
    case invalidData
    case errorDecoder
}

protocol FinanceServiceProtocol: AnyObject {
    func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, FinanceServiceError>) -> Void)
}

class FinanceService: FinanceServiceProtocol {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func load<T>(endpoint: FinanceEndpoint,
                 completion: @escaping (Result<T, FinanceServiceError>) -> Void
    ) where T : Decodable {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/\(endpoint.rawValue).json") else {
            return completion(.failure(.invalidURL))
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(.errorGeneric(description: error.localizedDescription)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                if let result = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(result))
                } else {
                    completion(.failure(.errorDecoder))
                }
            }
        }
        dataTask.resume()
    }
}
