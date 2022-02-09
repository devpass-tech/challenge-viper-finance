//
//  JSONProvider.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 08/02/22.
//

import Foundation

enum ContentProvider: Error {
    case decode, fileNotFound, invalidData
}

protocol ContentProviderProtocol {
    func load<T: Decodable>(jsonName: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class LocalJSONProvider: ContentProviderProtocol {
    func load<T: Decodable>(jsonName: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json") else {
            completion(.failure(ContentProvider.fileNotFound))
            return
        }

        guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
            completion(.failure(ContentProvider.invalidData))
            return
        }

        guard let decodedData = try? JSONDecoder().decode(T.self, from: jsonData) else {
            completion(.failure(ContentProvider.decode))
            return
        }

        completion(.success(decodedData))
    }
}
