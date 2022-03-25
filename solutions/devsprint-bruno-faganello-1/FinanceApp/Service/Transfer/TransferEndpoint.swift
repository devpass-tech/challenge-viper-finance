//
//  TransferEndpoint.swift
//  FinanceApp
//
//  Created by Ludimila da bela cruz on 24/03/22.
//
enum TransferEndpoint: Endpoint {
    
    case transfer
    
    var path: String {
        switch self {
        case .transfer:
            return "/devpass-tech/challenge-viper-finance/main/api/transfer_successful_endpoint.json"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .transfer:
            return .get
        }
    }
}
