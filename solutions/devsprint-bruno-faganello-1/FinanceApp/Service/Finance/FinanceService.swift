//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

protocol FinanceServiceProtocol {
    func fetchActivityDetail() async -> Result<Activity, RequestError>
}

struct FinanceService: HTTPClient, FinanceServiceProtocol {
    
    func fetchActivityDetail() async -> Result<Activity, RequestError> {
        return await sendRequest(endpoint: FinanceEndpoint.activityDetail, responseModel: Activity.self)
    }
}
