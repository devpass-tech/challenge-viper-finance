//
//  NetworkService .swift
//  FinanceApp
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 15/07/22.
//

import Foundation

enum NetworkServiceEndpoint: String {
    case userProfile = "user_profile_endpoint"
    case contactList = "contact_list_endpoint"
    case home = "home_endpoint"
    case transfers = "transfer_successful_endpoint"
}

enum NetworkServiceError: Error {
    case invalidURL
    case errorGeneric(description: String)
    case invalidResponse
    case invalidData
    case errorDecoder
}

protocol NetworkServiceProtocol: AnyObject {
    func load<T: Decodable>(endpoint: NetworkServiceEndpoint, completion: @escaping (Result<T, NetworkServiceError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private var service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load<T>(endpoint: NetworkServiceEndpoint, completion: @escaping (Result<T, NetworkServiceError>) -> Void)
    where T : Decodable {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/\(endpoint.rawValue).json") else {
            return completion(.failure(.invalidURL))
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
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
        .resume()
    }
}
