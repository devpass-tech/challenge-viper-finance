//
//  FinanceEndpoint.swift
//  FinanceApp
//
//  Created by Victor Catão on 17/03/22.
//

enum FinanceEndpoint {
    case activityDetail
}

extension FinanceEndpoint: Endpoint {
    var path: String {
        switch self {
        case .activityDetail:
            return "activity_details_endpoint.json"
        }
    }

    var method: RequestMethod {
        switch self {
        case .activityDetail:
            return .get
        }
    }
}
