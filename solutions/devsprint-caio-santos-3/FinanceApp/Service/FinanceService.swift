//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol {
    func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, FinanceServiceError>) -> Void)
}

struct FinanceService: FinanceServiceProtocol {
    
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func load<T>(
        endpoint: FinanceEndpoint,
        completion: @escaping (Result<T, FinanceServiceError>) -> Void
    ) where T : Decodable {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/\(endpoint.rawValue).json") else { return completion(.failure(.invalidURL)) }
        
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
