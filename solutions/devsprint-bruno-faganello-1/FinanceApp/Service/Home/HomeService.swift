//
//  HomeService.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

protocol HomeServiceProtocol {
    func fetchHomeInformation() async -> Result<HomeData, RequestError>
}

struct HomeService: HTTPClient, HomeServiceProtocol {
    func fetchHomeInformation() async -> Result<HomeData, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.homeInformation, responseModel: HomeData.self)
    }
}
