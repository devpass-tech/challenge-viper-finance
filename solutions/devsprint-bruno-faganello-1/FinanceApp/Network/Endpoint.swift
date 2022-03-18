//
//  Endpoint.swift
//  FinanceApp
//
//  Created by Victor Catão on 17/03/22.
//

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var header: [String: String]? {
        return nil
    }

    var body: [String: String]? {
        return nil
    }
}
