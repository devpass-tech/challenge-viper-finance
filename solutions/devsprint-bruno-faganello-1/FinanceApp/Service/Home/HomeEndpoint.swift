//
//  HomeEndpoint.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

enum HomeEndpoint {
    case homeInformation
}

extension HomeEndpoint: Endpoint {
    var path: String {
        switch self {
        case .homeInformation:
            return "/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .homeInformation:
            return .get
        }
    }
}
