//
//  HomeService.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

// MARK: - HomeServiceProtocol

protocol HomeServiceProtocol {
    func fetchHomeInformation() async -> Result<HomeData, RequestError>
}

// MARK: - HomeService

struct HomeService: HTTPClient, HomeServiceProtocol {
    
    // MARK: Public Methods
    
    func fetchHomeInformation() async -> Result<HomeData, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.homeInformation, responseModel: HomeData.self)
    }
}
